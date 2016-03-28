package com.wingko.story.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpUtils;

import org.apache.log4j.Logger;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;



/**
 * A utility class to handle <code>multipart/form-data</code> requests,
 * the kind of requests that support file uploads.  This class emulates the
 * interface of <code>HttpServletRequest</code>, making it familiar to use.
 * It uses a "push" model where any incoming files are read and saved directly
 * to disk in the constructor. If you wish to have more flexibility, e.g.
 * write the files to a database, use the "pull" model
 * <code>MultipartParser</code> instead.
 * <p>
 * This class can receive arbitrarily large files (up to an artificial limit
 * you can set), and fairly efficiently too.
 * It cannot handle nested data (multipart content within multipart content).
 * It <b>can</b> now with the latest release handle internationalized content
 * (such as non Latin-1 filenames).
 * <p>
 * To avoid collisions and have fine control over file placement, there's a
 * constructor variety that takes a pluggable FileRenamePolicy implementation.
 * A particular policy can choose to rename or change the location of the file
 * before it's written.
 * <p>
 * See the included upload.war for an example of how to use this class.
 * <p>
 * The full file upload specification is contained in experimental RFC 1867,
 * available at <a href="http://www.ietf.org/rfc/rfc1867.txt">
 * http://www.ietf.org/rfc/rfc1867.txt</a>.
 *
 * @see MultipartParser
 *
 * @author Jason Hunter
 * @author Geoff Soutter
 * @version 1.11, 2002/11/01, combine query string params in param list<br>
 * @version 1.10, 2002/05/27, added access to the original file names<br>
 * @version 1.9, 2002/04/30, added support for file renaming, thanks to
 *                           Changshin Lee<br>
 * @version 1.8, 2002/04/30, added support for internationalization, thanks to
 *                           Changshin Lee<br>
 * @version 1.7, 2001/02/07, made fields protected to increase user flexibility<br>
 * @version 1.6, 2000/07/21, redid internals to use MultipartParser,
 *                           thanks to Geoff Soutter<br>
 * @version 1.5, 2000/02/04, added auto MacBinary decoding for IE on Mac<br>
 * @version 1.4, 2000/01/05, added getParameterValues(),
 *                           WebSphere 2.x getContentType() workaround,
 *                           stopped writing empty "unknown" file<br>
 * @version 1.3, 1999/12/28, IE4 on Win98 lastIndexOf("boundary=")
 * workaround<br>
 * @version 1.2, 1999/12/20, IE4 on Mac readNextPart() workaround<br>
 * @version 1.1, 1999/01/15, JSDK readLine() bug workaround<br>
 * @version 1.0, 1998/09/18<br>
 */
@SuppressWarnings("deprecation")
public class MultipartRequestWithSameFileTag {
  static Logger logger = Logger.getLogger(MultipartRequestWithSameFileTag.class);

  private static final int DEFAULT_MAX_POST_SIZE = 1024 * 1024;  // 1 Meg

  protected Hashtable<Object, Vector<String>> parameters = new Hashtable<Object, Vector<String>>();  // name - Vector of values
  //protected Hashtable files = new Hashtable();       // name - UploadedFile
  protected LinkedHashMap<String, UploadedFile> files = new LinkedHashMap<String, UploadedFile>();       // name - UploadedFile
  
  protected LinkedHashMap<String, NewUploadedFile> newfiles = new LinkedHashMap<String, NewUploadedFile>();       // name - UploadedFile

  /**
   * Constructs a new MultipartRequest to handle the specified request,
   * saving any uploaded files to the given directory, and limiting the
   * upload size to 1 Megabyte.  If the content is too large, an
   * IOException is thrown.  This constructor actually parses the
   * <tt>multipart/form-data</tt> and throws an IOException if there's any
   * problem reading or parsing the request.
   *
   * @param request the servlet request.
   * @exception IOException if the uploaded content is larger than 1 Megabyte
   * or there's a problem reading or parsing the request.
   */
  public MultipartRequestWithSameFileTag(HttpServletRequest request) throws IOException {
	  this(request, null, null);
  }
  
  /**
   * Constructs a new MultipartRequest to handle the specified request,
   * saving any uploaded files to the given directory, and limiting the
   * upload size to 1 Megabyte.  If the content is too large, an
   * IOException is thrown.  This constructor actually parses the
   * <tt>multipart/form-data</tt> and throws an IOException if there's any
   * problem reading or parsing the request.
   *
   * @param request the servlet request.
   * @param saveDirectory the directory in which to save any uploaded files.
   * @exception IOException if the uploaded content is larger than 1 Megabyte
   * or there's a problem reading or parsing the request.
   */
  public MultipartRequestWithSameFileTag(HttpServletRequest request,
                          String saveDirectory) throws IOException {
    this(request, saveDirectory, DEFAULT_MAX_POST_SIZE);
  }

  /**
   * Constructs a new MultipartRequest to handle the specified request,
   * saving any uploaded files to the given directory, and limiting the
   * upload size to the specified length.  If the content is too large, an
   * IOException is thrown.  This constructor actually parses the
   * <tt>multipart/form-data</tt> and throws an IOException if there's any
   * problem reading or parsing the request.
   *
   * @param request the servlet request.
   * @param saveDirectory the directory in which to save any uploaded files.
   * @param maxPostSize the maximum size of the POST content.
   * @exception IOException if the uploaded content is larger than
   * <tt>maxPostSize</tt> or there's a problem reading or parsing the request.
   */
  public MultipartRequestWithSameFileTag(HttpServletRequest request,
                          String saveDirectory,
                          int maxPostSize) throws IOException {
    this(request, saveDirectory, maxPostSize, null, null);
  }

  /**
   * Constructs a new MultipartRequest to handle the specified request,
   * saving any uploaded files to the given directory, and limiting the
   * upload size to the specified length.  If the content is too large, an
   * IOException is thrown.  This constructor actually parses the
   * <tt>multipart/form-data</tt> and throws an IOException if there's any
   * problem reading or parsing the request.
   *
   * @param request the servlet request.
   * @param saveDirectory the directory in which to save any uploaded files.
   * @param encoding the encoding of the response, such as ISO-8859-1
   * @exception IOException if the uploaded content is larger than
   * 1 Megabyte or there's a problem reading or parsing the request.
   */
  public MultipartRequestWithSameFileTag(HttpServletRequest request,
                          String saveDirectory,
                          String encoding) throws IOException {
    this(request, saveDirectory, DEFAULT_MAX_POST_SIZE, encoding, null);
  }

  /**
   * Constructs a new MultipartRequest to handle the specified request,
   * saving any uploaded files to the given directory, and limiting the
   * upload size to the specified length.  If the content is too large, an
   * IOException is thrown.  This constructor actually parses the
   * <tt>multipart/form-data</tt> and throws an IOException if there's any
   * problem reading or parsing the request.
   *
   * @param request the servlet request.
   * @param saveDirectory the directory in which to save any uploaded files.
   * @param maxPostSize the maximum size of the POST content.
   * @param encoding the encoding of the response, such as ISO-8859-1
   * @exception IOException if the uploaded content is larger than
   * <tt>maxPostSize</tt> or there's a problem reading or parsing the request.
   */
  public MultipartRequestWithSameFileTag(HttpServletRequest request,
                          String saveDirectory,
                          int maxPostSize,
                          FileRenamePolicy policy) throws IOException {
    this(request, saveDirectory, maxPostSize, null, policy);
  }

  /**
   * Constructs a new MultipartRequest to handle the specified request,
   * saving any uploaded files to the given directory, and limiting the
   * upload size to the specified length.  If the content is too large, an
   * IOException is thrown.  This constructor actually parses the
   * <tt>multipart/form-data</tt> and throws an IOException if there's any
   * problem reading or parsing the request.
   *
   * @param request the servlet request.
   * @param saveDirectory the directory in which to save any uploaded files.
   * @param maxPostSize the maximum size of the POST content.
   * @param encoding the encoding of the response, such as ISO-8859-1
   * @exception IOException if the uploaded content is larger than
   * <tt>maxPostSize</tt> or there's a problem reading or parsing the request.
   */
  public MultipartRequestWithSameFileTag(HttpServletRequest request,
                          String saveDirectory,
                          int maxPostSize,
                          String encoding) throws IOException {
    this(request, saveDirectory, maxPostSize, encoding, null);
  }

  /**
   * Constructs a new MultipartRequest to handle the specified request,
   * saving any uploaded files to the given directory, and limiting the
   * upload size to the specified length.  If the content is too large, an
   * IOException is thrown.  This constructor actually parses the
   * <tt>multipart/form-data</tt> and throws an IOException if there's any
   * problem reading or parsing the request.
   *
   * To avoid file collisions, this constructor takes an implementation of the
   * FileRenamePolicy interface to allow a pluggable rename policy.
   *
   * @param request the servlet request.
   * @param saveDirectory the directory in which to save any uploaded files.
   * @param maxPostSize the maximum size of the POST content.
   * @param encoding the encoding of the response, such as ISO-8859-1
   * @param policy a pluggable file rename policy
   * @exception IOException if the uploaded content is larger than
   * <tt>maxPostSize</tt> or there's a problem reading or parsing the request.
   */

  public MultipartRequestWithSameFileTag(HttpServletRequest request,
                          String saveDirectory,
                          int maxPostSize,
                          String encoding,
                          FileRenamePolicy policy) throws IOException {
    // Sanity check values
    if (request == null)
      throw new IllegalArgumentException("request cannot be null");
    if (saveDirectory == null)
      throw new IllegalArgumentException("saveDirectory cannot be null");
    if (maxPostSize <= 0) {
      throw new IllegalArgumentException("maxPostSize must be positive");
    }

    // Save the dir
    File dir = new File(saveDirectory);

    // Check saveDirectory is truly a directory
    if (!dir.isDirectory())
      throw new IllegalArgumentException("Not a directory: " + saveDirectory);

    // Check saveDirectory is writable
    if (!dir.canWrite())
      throw new IllegalArgumentException("Not writable: " + saveDirectory);

    
    
    // Parse the incoming multipart, storing files in the dir provided,
    // and populate the meta objects which describe what we found
    MultipartParser parser = new MultipartParser(request, maxPostSize, true, true, encoding);
    
    
    

    // Some people like to fetch query string parameters from
    // MultipartRequest, so here we make that possible.  Thanks to
    // Ben Johnson, ben.johnson@merrillcorp.com, for the idea.
    if (request.getQueryString() != null) {
      // Let HttpUtils create a name->String[] structure
    	
      Hashtable<?, ?> queryParameters = HttpUtils.parseQueryString(request.getQueryString());
      
      // For our own use, name it a name->Vector structure
      Enumeration<?> queryParameterNames = queryParameters.keys();
      
      while (queryParameterNames.hasMoreElements()) {
    	  
    	  Object paramName = queryParameterNames.nextElement();
    	  String[] values = (String[])queryParameters.get(paramName);
    	  
    	  Vector<String> newValues = new Vector<String>();
    	  
    	  for (int i = 0; i < values.length; i++) {
    		  newValues.add(values[i]);
    	  }

    	  parameters.put(paramName, newValues);
      }
    }

    Part part;

    int iiii=1;//추가된 부분 배열처리를 위해
    String name_tmp ="";
    
    while ((part = parser.readNextPart()) != null) {
    	
    	String name = part.getName();
    	
    	if (part.isParam()) {
    		// It's a parameter part, add it to the vector of values
    		ParamPart paramPart = (ParamPart) part;
    		String value = paramPart.getStringValue();
    		Vector<String> existingValues = (Vector<String>)parameters.get(name);
    		
    		if (existingValues == null) {
    			existingValues = new Vector<String>();
    			parameters.put(name, existingValues);
    		}
    		
    		existingValues.addElement(value);
    	}

    	else if ( part.isFile() ) {
    		// It's a file part
    		FilePart filePart = (FilePart) part;

    		String fileName = filePart.getFileName();

    		if (fileName != null) {

    			filePart.setRenamePolicy(policy);
    			filePart.writeTo(dir);

    			if(name_tmp.equals(name)) {//추가된 부분 배열처리를 위해

    				name = name+iiii;
    				iiii++;
    			} else {
    				name_tmp = name;
    			}
    			 
    			files.put(name, new UploadedFile(dir.toString(),
                      filePart.getFileName(),
                      fileName,
                      filePart.getContentType()));	
    		}
        /*else {
        	logger.info("file name is null--->");
          // The field did not contain a file
          files.put(name, new UploadedFile(null, null, null, null));

        }*/
    	}

	}
  }
  
  @SuppressWarnings("null")
public MultipartRequestWithSameFileTag(HttpServletRequest request,
          String saveDirectory,
          int maxPostSize,
          String encoding,
          FileRenamePolicy policy, String etc) throws IOException {
	  
	List<byte[]> fileList = new ArrayList<byte[]>();
	 
	// Sanity check values
	if (request == null)
	throw new IllegalArgumentException("request cannot be null");
	
	if (maxPostSize <= 0) {
	throw new IllegalArgumentException("maxPostSize must be positive");
	}

	// Parse the incoming multipart, storing files in the dir provided,
	// and populate the meta objects which describe what we found
	MultipartParser parser =
	new MultipartParser(request, maxPostSize, true, true, encoding);

	// Some people like to fetch query string parameters from
	// MultipartRequest, so here we make that possible.  Thanks to
	// Ben Johnson, ben.johnson@merrillcorp.com, for the idea.
	if (request.getQueryString() != null) {
		// Let HttpUtils create a name->String[] structure
		Hashtable<?, ?> queryParameters = HttpUtils.parseQueryString(request.getQueryString());
		
		// For our own use, name it a name->Vector structure
		Enumeration<?> queryParameterNames = queryParameters.keys();
		
		while (queryParameterNames.hasMoreElements()) {
			Object paramName = queryParameterNames.nextElement();
			String[] values = (String[])queryParameters.get(paramName);
			Vector<String> newValues = new Vector<String>();
			
			for (int i = 0; i < values.length; i++) {
				newValues.add(values[i]);
			}
			
			parameters.put(paramName, newValues);
		}
	}

	Part part;

	int iiii=1;//추가된 부분 배열처리를 위해
	String name_tmp ="";
	
	while ((part = parser.readNextPart()) != null) {
		String name = part.getName();
		
		if (part.isParam()) {
			// It's a parameter part, add it to the vector of values
			ParamPart paramPart = (ParamPart) part;
			String value = paramPart.getStringValue();
			Vector<String> existingValues = (Vector<String>)parameters.get(name);
			
			if (existingValues == null) {
				existingValues = new Vector<String>();
				parameters.put(name, existingValues);
			}
			
			existingValues.addElement(value);
		}
		else if (part.isFile()) {
			// It's a file part
			FilePart filePart = (FilePart) part;
			String fileName = filePart.getFileName();
			InputStream FileStream = null;
			
			//filePart.setRenamePolicy(policy);  // null policy is OK
	          
	          // The part actually contained a file
	          //filePart.writeTo(dir);
	          
			if (fileName != null) {
				//filePart.setRenamePolicy(policy);  // null policy is OK

				if(name_tmp.equals(name)){//추가된 부분 배열처리를 위해
					name = name+iiii;
					iiii++;
				}else{
					name_tmp = name;
				}
			
				FileStream = filePart.getInputStream();

	            ByteArrayOutputStream baos = new ByteArrayOutputStream(1024*500);
	            
				try {
						byte[] fileBuffer = new byte[1024]; // 1k
						int len = -1;

						while ( (len = FileStream.read(fileBuffer)) != -1) {
							baos.write(fileBuffer, 0, len);
						}
				} finally {
				    if (FileStream != null) try { FileStream.close(); } catch(IOException ex) {}
				}

				newfiles.put(name, new NewUploadedFile(filePart.getFileName(), fileName, filePart.getContentType(), baos.toByteArray()));
			}
		}
	}
  }  


/**
   * Constructor with an old signature, kept for backward compatibility.
   * Without this constructor, a servlet compiled against a previous version
   * of this class (pre 1.4) would have to be recompiled to link with this
   * version.  This constructor supports the linking via the old signature.
   * Callers must simply be careful to pass in an HttpServletRequest.
   *
   */
  public MultipartRequestWithSameFileTag(ServletRequest request,
                          String saveDirectory) throws IOException {
    this((HttpServletRequest)request, saveDirectory);
  }

  /**
   * Constructor with an old signature, kept for backward compatibility.
   * Without this constructor, a servlet compiled against a previous version
   * of this class (pre 1.4) would have to be recompiled to link with this
   * version.  This constructor supports the linking via the old signature.
   * Callers must simply be careful to pass in an HttpServletRequest.
   *
   */
  public MultipartRequestWithSameFileTag(ServletRequest request,
                          String saveDirectory,
                          int maxPostSize) throws IOException {
    this((HttpServletRequest)request, saveDirectory, maxPostSize);
  }
  
   
  /**
   * Returns the names of all the parameters as an Enumeration of
   * Strings.  It returns an empty Enumeration if there are no parameters.
   *
   * @return the names of all the parameters as an Enumeration of Strings.
   */
  public Enumeration<Object> getParameterNames() {
    return parameters.keys();
  }

  /**
   * Returns the names of all the uploaded files as an Enumeration of
   * Strings.  It returns an empty Enumeration if there are no uploaded
   * files.  Each file name is the name specified by the form, not by
   * the user.
   *
   * @return the names of all the uploaded files as an Enumeration of Strings.
   */
 /* public Enumeration getFileNames() {
    return files.keys();
    
  }*/
  public Set<String> getFileNames() {
	    return files.keySet();
	  }

  public Set<String> getNewFileNames() {
	    return newfiles.keySet();
	  }
 
  /**
   * Returns the value of the named parameter as a String, or null if
   * the parameter was not sent or was sent without a value.  The value
   * is guaranteed to be in its normal, decoded form.  If the parameter
   * has multiple values, only the last one is returned (for backward
   * compatibility).  For parameters with multiple values, it's possible
   * the last "value" may be null.
   *
   * @param name the parameter name.
   * @return the parameter value.
   */
  public String getParameter(String name) {
    try {
      Vector<?> values = (Vector<?>)parameters.get(name);
      if (values == null || values.size() == 0) {
        return null;
      }
      String value = (String)values.elementAt(values.size() - 1);
      return value;
    }
    catch (Exception e) {
      return null;
    }
  }

  /**
   * Returns the values of the named parameter as a String array, or null if
   * the parameter was not sent.  The array has one entry for each parameter
   * field sent.  If any field was sent without a value that entry is stored
   * in the array as a null.  The values are guaranteed to be in their
   * normal, decoded form.  A single value is returned as a one-element array.
   *
   * @param name the parameter name.
   * @return the parameter values.
   */
  public String[] getParameterValues(String name) {
    try {
      Vector<?> values = (Vector<?>)parameters.get(name);
      if (values == null || values.size() == 0) {
        return null;
      }
      String[] valuesArray = new String[values.size()];
      values.copyInto(valuesArray);
      return valuesArray;
    }
    catch (Exception e) {
      return null;
    }
  }

 


	/**
	 * Returns the filesystem name of the specified file, or null if the
	 * file was not included in the upload.  A filesystem name is the name
	 * specified by the user.  It is also the name under which the file is
	 * actually saved.
	 *
	 * @param name the file name.
	 * @return the filesystem name of the file.
	 */
	public String getFilesystemName(String name) {
	  try {
	    UploadedFile file = (UploadedFile)files.get(name);
	
	    return file.getFilesystemName();  // may be null
	  }
	  catch (Exception e) {
	    return null;
	  }
	}
	
	/**
	 * Returns the original filesystem name of the specified file (before any
	 * renaming policy was applied), or null if the file was not included in
	 * the upload.  A filesystem name is the name specified by the user.
	 *
	 * @param name the file name.
	 * @return the original file name of the file.
	 */
	public String getOriginalFileName(String name) {
	  try {
	    UploadedFile file = (UploadedFile)files.get(name);

	    return file.getOriginalFileName();  // may be null
	  }
	  catch (Exception e) {
	    return null;
	  }
	}
	
	/**
	 * Returns the content type of the specified file (as supplied by the
	 * client browser), or null if the file was not included in the upload.
	 *
	 * @param name the file name.
	 * @return the content type of the file.
	 */
	public String getContentType(String name) {
	  try {
	    UploadedFile file = (UploadedFile)files.get(name);
	    return file.getContentType();  // may be null
	  }
	  catch (Exception e) {
	    return null;
	  }
	}
	
	/**
	 * Returns a File object for the specified file saved on the server's
	 * filesystem, or null if the file was not included in the upload.
	 *
	 * @param name the file name.
	 * @return a File object for the named file.
	 */
	public File getFile(String name) {
	  try {
	    UploadedFile file = (UploadedFile)files.get(name);
	    return file.getFile();  // may be null
	  }
	  catch (Exception e) {
	    return null;
	  }
	}
	
	
	//A class to hold information about an uploaded file.
	//
	class UploadedFile {
		//static Logger logger = Logger.getLogger(MultipartRequestWithSameFileTag.class);
		
		private String dir;
		private String filename;
		private String original;
		private String type;
		
		UploadedFile(String dir, String filename, String original, String type) {
		  this.dir = dir;
		  this.filename = filename;
		  this.original = original;
		  this.type = type;
		}
		
		public String getContentType() {
		  return type;
		}
		
		public String getFilesystemName() {
		  return filename;
		}
		
		public String getOriginalFileName() {
		
		  return original;
		}
		
		public File getFile() {
		  if (dir == null || filename == null) {
		    return null;
		  }
		  else {
		    return new File(dir + File.separator + filename);
		  }
		}
	}

	/**
	 * Returns the filesystem name of the specified file, or null if the
	 * file was not included in the upload.  A filesystem name is the name
	 * specified by the user.  It is also the name under which the file is
	 * actually saved.
	 *
	 * @param name the file name.
	 * @return the filesystem name of the file.
	 */
	public String getNewFilesystemName(String name) {
	  try {
		  NewUploadedFile file = (NewUploadedFile)newfiles.get(name);
	
	    return file.getNewFilesystemName();  // may be null
	  }
	  catch (Exception e) {
	    return null;
	  }
	}
	
	/**
	 * Returns the original filesystem name of the specified file (before any
	 * renaming policy was applied), or null if the file was not included in
	 * the upload.  A filesystem name is the name specified by the user.
	 *
	 * @param name the file name.
	 * @return the original file name of the file.
	 */
	public String getNewOriginalFileName(String name) {
	  try {
		NewUploadedFile file = (NewUploadedFile)newfiles.get(name);

	    return file.getNewOriginalFileName();  // may be null
	  }
	  catch (Exception e) {
	    return null;
	  }
	}

	/**
	 * Returns the content type of the specified file (as supplied by the
	 * client browser), or null if the file was not included in the upload.
	 *
	 * @param name the file name.
	 * @return the content type of the file.
	 */
	public String getNewContentType(String name) {
	  try {
		  NewUploadedFile file = (NewUploadedFile)newfiles.get(name);
	    return file.getNewContentType();  // may be null
	  }
	  catch (Exception e) {
	    return null;
	  }
	}
	
	/**
	 * Returns a File object for the specified file saved on the server's
	 * filesystem, or null if the file was not included in the upload.
	 *
	 * @param name the file name.
	 * @return a File object for the named file.
	 */
	public File getNewFile(String name, File NewDir, String newFileName) {
	  try {
		NewUploadedFile file = (NewUploadedFile)newfiles.get(name);

	    return file.getNewFile(NewDir, newFileName);  // may be null
	  }
	  catch (Exception e) {
	    return null;
	  }
	}
	
	public byte[] getNewFileStream(String name) {
		  try {
			NewUploadedFile file = (NewUploadedFile)newfiles.get(name);

		    return file.getNewFileStream();  // may be null
		  }
		  catch (Exception e) {
		    return null;
		  }
	}	
	
	//A class to hold information about an uploaded file.
	//
	class NewUploadedFile {
		//static Logger logger = Logger.getLogger(MultipartRequestWithSameFileTag.class);
		
		//private String dir;
		private String filename;
		private String original;
		private String type;
		private byte[] filestream;
		
		NewUploadedFile(String filename, String original, String type, byte[] FileStream) {
		  //this.dir = dir;
		  this.filename = filename;
		  this.original = original;
		  this.filestream = FileStream;
		}

		public String getNewContentType() {
		  return type;
		}
		
		public String getNewFilesystemName() {
		  return filename;
		}
		
		public String getNewOriginalFileName() {
		  return original;
		}
		
		public byte[] getNewFileStream() {
			  return filestream;
		}
		
		public File getNewFile(File NewDir, String newFileName) throws IOException {
		  if (NewDir == null || filename == null) {
			  return null;
		  }
		  else {
			  return new File(NewDir.toString() + File.separator + filename);
		  }
		}
	}
}