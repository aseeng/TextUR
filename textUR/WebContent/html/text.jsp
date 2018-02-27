<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="sidebars.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>CodeMirror - Form</title>
<link rel="stylesheet" href="../plugins/codemirror/addon/hint/show-hint.css">
<link rel="stylesheet" type="text/css" href="../plugins/codemirror/lib/codemirror.css">
<link rel="stylesheet" type="text/css" href="../css/text.css">

</head>

 <body class="skin-red sidebar-collapse">
 <div class="box box-danger center" id="mainarea">
	<section class="content"> 
		<button type="button" id="close" class="btn btn-danger btn-sm" data-widget="remove" onclick="closeFile();">
			<i class="fa fa-times"></i>
         </button>
		<h2>${file.getName()}</h2>
		<div class="input-group-btn">
			<button type="button" id="options" class="btn btn-success dropdown-toggle" data-toggle="dropdown" > Options
				<span class="fa fa-caret-down"></span>
			</button>
			
			<ul class="dropdown-menu">
				<li><a onclick="removeFile();">Remove</a></li>
				<li><a onclick="createCheckfile();">Create checkpoint</a></li>
				<li><a onclick="consult();">Consult</a></li>
				<li><a onclick="findString();">Find String</a></li>
				<li><a onclick="renameFile();">Rename</a></li>
			</ul>
		</div>
		<article>
			<textarea class="codemirror-textarea" name="preview-form-comment" id="fileCode">${file.getCode()}</textarea>
		</article>
		
	</section>
</div>
	<section class="commentPlus" id="buttonSection">
		<div id="comments" class="col-md-3"></div>
		
	</section>
	
<div class="box box-danger center" id="contenuto">
	<section class="content"> 
		<h2 id ="name"> </h2>
	<div>
		<button class="btn bg-green" onclick="nascondi();"> Hide </button>
		<button class="btn bg-green" onclick="ripristina();" id="ripristina">Restore</button>
	</div>
		<article><textarea class="codemirror-textarea" name="preview-form-comment" id="textarea2">  </textarea> 	</article>
	</section>
</div>	
	
	<!-- javascript -->
	<script src="../javascript/jquery-3.2.1.min.js"></script>
	<script src="../plugins/codemirror/lib/codemirror.js"></script>
	<script src="../plugins/codemirror/mode/clike/clike.js "></script>
	<script src="../plugins/codemirror/addon/hint/css-hint.js"></script>
	<script src="../plugins/codemirror/addon/hint/show-hint.js"></script>
	<script src="../plugins/codemirror/addon/edit/closebrackets.js"></script>
	<script src="../javascript/text.js"></script>
	
</body>

</html>