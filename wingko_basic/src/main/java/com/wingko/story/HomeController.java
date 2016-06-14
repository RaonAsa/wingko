package com.wingko.story;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wingko.story.dao.AdDao;
import com.wingko.story.dao.CommunityDao;
import com.wingko.story.dao.NewsDao;
import com.wingko.story.dao.RecommendDao;
import com.wingko.story.dao.ScrapDao;
import com.wingko.story.dao.SearchDao;
import com.wingko.story.dao.StoreDao;
import com.wingko.story.dao.TravelDao;
import com.wingko.story.domain.AdData;
import com.wingko.story.domain.Recommend;
import com.wingko.story.domain.Scrap;
import com.wingko.story.domain.Search;
import com.wingko.story.domain.SelectData;
import com.wingko.story.util.CommonUtil;
import com.wingko.story.util.DateUtil;
import com.wingko.story.util.HttpUtil;
import com.wingko.story.util.JSONUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private AdDao adDao;
	@Autowired
	private NewsDao newsDao;
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private SearchDao searchDao;
	@Autowired
	private CommunityDao communityDao;
	@Autowired
	private RecommendDao recommendDao;
	@Autowired
	private ScrapDao scrapDao;
	@Autowired
	private TravelDao travelDao;
	
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test(Model model, HttpServletResponse response, HttpServletRequest request) {
		return "test";
	}

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
//		model.addAttribute("weatherList", getWeather());

		return "redirect:index.do";
		
		/*logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		logger.info("currentTimeMillis " +  Long.toString( System.currentTimeMillis() ));
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("coupon", Coupon.getCreateCoupon() );
		
		return "home";*/
	}
	
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) throws Exception {
		
		model.addAttribute("weatherList", getWeather());
		
		
		model.addAttribute("notice", communityDao.getNoticeTopFour());
		
	
		model.addAttribute("topAd", adDao.getMainTopAd());
		model.addAttribute("topBottomAd", adDao.getMainTopBottomAd());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("news_category_no", 1);
		map.put("top", 3);
		model.addAttribute("news1", newsDao.getTopThree(map));
		
		map.clear();
		map.put("news_category_no", 2);
		map.put("top", 3);
		model.addAttribute("news2", newsDao.getTopThree(map));
		
		map.clear();
		map.put("news_category_no", 3);
		map.put("top", 3);
		model.addAttribute("news3", newsDao.getTopThree(map));

		map.clear();
		map.put("news_category_no", 4);
		map.put("top", 6);
		model.addAttribute("chinaNews", newsDao.getTopThree(map));

		
		
		
		
		LinkedHashMap<Object, Object> adNewsMap = new LinkedHashMap<Object, Object>();

		map.clear();
		map.put("news_category_no", 8);
		map.put("top", 6);
		adNewsMap.put(1, newsDao.getTopThree(map));

		map.clear();
		map.put("news_category_no", 9);
		map.put("top", 6);
		adNewsMap.put(2, newsDao.getTopThree(map));
		
		map.clear();
		map.put("news_category_no", 7);
		map.put("top", 6);
		adNewsMap.put(3, newsDao.getTopThree(map));
		
		map.clear();
		map.put("news_category_no", 5);
		map.put("top", 6);
		adNewsMap.put(4, newsDao.getTopThree(map));
		
		map.clear();
		map.put("news_category_no", 6);
		map.put("top", 6);
		adNewsMap.put(5, newsDao.getTopThree(map));
		
		map.clear();
		map.put("news_category_no", 10);
		map.put("top", 6);
		adNewsMap.put(6, newsDao.getTopThree(map));
		
		model.addAttribute("adNewsJson", JSONUtil.ObjectToJSON(adNewsMap));

		
		
		model.addAttribute("railPass", travelDao.travelRailOne());
		
		
		
		/*
		 * 환율 정보 가져오기
		 */
		String data = HttpUtil.getString("http://community.fxkeb.com/fxportal/jsp/RS/DEPLOY_EXRATE/fxrate_all.html", "EUC-KR");
		String ex_date = data;
		
		data = data.substring(data.indexOf("CNY"),  data.indexOf("</tr>", data.indexOf("CNY")));
		data = data.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		data = data.replaceAll("\t", "");
		data = data.replaceAll(" ", "");
		data = data.replaceAll("\n", "|");
		String[] array;
		array= data.split("\\|");
		try {
			ex_date = ex_date.substring( ex_date.indexOf("<div class='date'>\n<p>")+22, ex_date.indexOf("<div class='date'>\n<p>")+22+16 );
			array[0] = "0.0";
			model.addAttribute("ex_date", ex_date);
			model.addAttribute("ex_buy", array[1]);
			model.addAttribute("ex_sell", array[2]);
			model.addAttribute("ex_now", array[0]);

	    	int rnd = (int) (Math.floor(Math.random() * 10) + 1);
	    	model.addAttribute("rnd", rnd%3);
			
		} catch (Exception e) {
			
		}

		return "index";
	}

	
	@RequestMapping(value="/json_category.do")
	@ResponseBody
	public void category(HttpServletResponse res, @RequestParam(value="category_no", defaultValue="0") String category_no, @RequestParam(value="depth", defaultValue="1") String depth) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("depth", depth);
		map.put("category_no", category_no);
		
		List<SelectData> list = storeDao.getCategoryForSelect(map);

		String jsonData = JSONUtil.ObjectToJSON(list);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
	}
	@RequestMapping(value="/json_location.do")
	@ResponseBody
	public void location(HttpServletResponse res, @RequestParam(value="location_no", defaultValue="0") String location_no, @RequestParam(value="depth", defaultValue="1") String depth) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("depth", depth);
		map.put("location_no", location_no);
		
		List<SelectData> list = storeDao.getLocationForSelect(map);

		String jsonData = JSONUtil.ObjectToJSON(list);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
	}
	
	
	
	@RequestMapping(value="/json_toprightad.do")
	@ResponseBody
	public void topRightAd(HttpServletResponse res, @RequestParam(value="location_no", defaultValue="0") String location_no, @RequestParam(value="depth", defaultValue="1") String depth) throws Exception {
		List<AdData> list = adDao.getMainTopRightAd();

		String jsonData = JSONUtil.ObjectToJSON(list);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
	}
	
	@RequestMapping(value="/json_recommendinsert.do")
	@ResponseBody
	public void recommendInsert(HttpServletResponse res, Recommend recommend) throws Exception {
		int result = -1;
		
		result = recommendDao.check(recommend);
		if (result == 0) {
			result = recommendDao.insert(recommend);
			
			if( "travel".equals(recommend.getParent_code()) ) {
				recommendDao.travelRecommendUpdate(recommend);
			} else if( "community".equals(recommend.getParent_code()) ) {
				recommendDao.communityRecommendUpdate(recommend);
			}
			
		} else {
			result = -1;
		}

		String jsonData = JSONUtil.ObjectToJSON(result);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
	}
	
	
	@RequestMapping(value="/json_scrapinsert.do")
	@ResponseBody
	public void scrapInsert(HttpServletResponse res, Scrap scrap) throws Exception {
		int result = -1;
		
		result = scrapDao.check(scrap);
		if (result == 0) {
			result = scrapDao.insert(scrap);
		} else {
			result = -1;
		}

		String jsonData = JSONUtil.ObjectToJSON(result);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
	}
	
	
	
	
	@RequestMapping(value="/json_quick.do")
	@ResponseBody
	public void quick(HttpServletResponse res, HttpServletRequest request) throws Exception {
		
		String pids = "";
		String newPids = "";
		int chk = 0;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
				
			for (int i = 0; i < cookies.length; i++) {
				if ("quick".equals(cookies[i].getName())) {
					pids = cookies[i].getValue();
					logger.info(pids);
				}
			}

			List<Search> list = new ArrayList<Search>();
			
			String[] tempString = pids.split("\\|");
			for (int i = 0; i < tempString.length; i++) {
				if (chk > 4) {
					break;
				}
				try {
					String temp = tempString[i];
					if (newPids.indexOf(temp) > -1) {

					} else {
						newPids += temp + "|";
						String[] temps = temp.split("\\.");
			
						HashMap<String, String> map = new HashMap<String, String>();
						map.put("type", temps[0]);
						map.put("no", temps[1]);
			
						Search search = new Search();
						search = searchDao.getSearchListForQuick(map);
						list.add(search);
						chk++;
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

			}
			
			String jsonData = JSONUtil.ObjectToJSON(list);
			res.setCharacterEncoding("utf-8");
			res.getWriter().write(jsonData);
			
			
			
			Cookie cookie = new Cookie("quick", newPids);
		    cookie.setMaxAge(DateUtil.getSecondForCookie());
		    cookie.setPath("/");
		    res.addCookie(cookie);
		} else {
			res.setCharacterEncoding("utf-8");
			res.getWriter().write("[]");
		}

	}
	
	
	
	private List<Map<String, String>> getWeather() {
		String[] location = {"Seoul", "Jeju", "Busan"};
		String[] location_no = {"12", "13", "15"};
		String[] wCode = {"1132599", "2345963", "2345968"};
		
		List<Map<String, String>> weatherList = new ArrayList<Map<String,String>>();
		
		try {
			for (int i = 0; i < wCode.length; i++) {
				String urlString = "http://weather.yahooapis.com/forecastrss?w="+wCode[i]+"&u=c";

				DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = builderFactory.newDocumentBuilder();
				Document doc = builder.parse(urlString);

		        NodeList yweather = doc.getElementsByTagName("yweather:condition");
		        Node weather = yweather.item(0);
		        Element w = (Element) weather;
		        
	            NodeList description = doc.getElementsByTagName("description");
	            Node desc = description.item(1);
	            String image =  desc.getTextContent();
	            image = image.substring(image.indexOf("<img src=")+10, image.indexOf("\"/>"));

		        HashMap<String, String> map = new HashMap<String, String>();
		        map.put("location", location[i]);
		        map.put("location_no", location_no[i]);
		        map.put("code", CommonUtil.convertWeatherCode(w.getAttribute("code")));
		        map.put("temp", w.getAttribute("temp"));
		        map.put("text", w.getAttribute("text"));
		        map.put("image", CommonUtil.getWeatherImage(w.getAttribute("code")));

		        weatherList.add(map);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return weatherList;
	}
	
	
	@RequestMapping(value="/filedown.do", method=RequestMethod.GET)
	public void fileDown(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value="filename", required=true)String filename,
			@RequestParam(value="filepath", defaultValue="")String filepath) throws Exception {
		String uploadTempPath = "";
		if ("".equals(filepath)) {
			uploadTempPath = "/home/wingko/www/root/file/";	
		} else {
			uploadTempPath = "/home/wingko/www/root/" + filepath;
		}

		File file = new File(uploadTempPath+filename);

		String userAgent = request.getHeader("User-Agent");

		String file_name = "";
		boolean ie = userAgent.indexOf("MSIE") > -1;
		if(ie){
			file_name = URLEncoder.encode(file.getName(), "utf-8").replaceAll("\\+", " ");
		} else {
			file_name = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
		}

		response.setHeader("Content-Disposition", "attachment;filename=\""+file_name+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentType("application/download; utf-8");
		response.setContentLength((int)file.length());

		OutputStream out = response.getOutputStream();
        FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			byte[] outputByte = new byte[4096];
			while (fis.read(outputByte, 0, 4096) != -1) {
				out.write(outputByte, 0, 4096);
			}
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();	
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
	}
	
}
