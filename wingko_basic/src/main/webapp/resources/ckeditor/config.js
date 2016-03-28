/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For the complete reference:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
						{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
						{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
						{ name: 'links' },
						{ name: 'insert' },
						{ name: 'forms' },
						{ name: 'tools' },
						{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
						{ name: 'others' },
						'/',
						{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
						{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
						{ name: 'styles' },
						{ name: 'colors' }
					];
	/*config.toolbarGroups = [
	                		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
	                		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
	                		{ name: 'links' },
	                		{ name: 'insert' },
	                		{ name: 'forms' },
	                		{ name: 'tools' },
	                		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
	                		{ name: 'others' },
	                		'/',
	                		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	                		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
	                		{ name: 'styles' },
	                		{ name: 'colors' },
	                		{ name: 'about' }
	                	];*/

	// Remove some buttons, provided by the standard plugins, which we don't
	// need to have in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Se the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Make dialogs simpler.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	
	
	config.image_previewText = "";
	
	
	config.allowedContent = true;
};


CKEDITOR.on( 'dialogDefinition', function( ev ){
    // Take the dialog name and its definition from the event data.
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
    // Check if the definition is from the dialog we're
    // interested in (the 'image' dialog). This dialog name found using DevTools plugin
    if ( dialogName == 'image' ){
        // Remove the 'Link' and 'Advanced' tabs from the 'Image' dialog.
//    	dialogDefinition.minHeight = 150;
//    	dialogDefinition.minWidth = 420;
        dialogDefinition.removeContents( 'Link' );    //링크 탭 제거
        dialogDefinition.removeContents( 'advanced' );  //상세정보 탭 제거

        // Get a reference to the 'Image Info' tab.
        var infoTab = dialogDefinition.getContents( 'info' );  //info탭을 제거하면 이미지 업로드가 안된다.
        // Remove unnecessary widgets/elements from the 'Image Info' tab.
//        infoTab.remove( 'txtHSpace'); //info 탭 내에 불필요한 엘레멘트들 제거
//        infoTab.remove( 'txtVSpace');
//        infoTab.remove( 'txtBorder');
//        infoTab.remove( 'txtWidth');
//        infoTab.remove( 'txtHeight');
//        infoTab.remove( 'ratioLock');
//        infoTab.remove( 'htmlPreview');
//        infoTab.remove( 'cmbAlign');
    }
});
