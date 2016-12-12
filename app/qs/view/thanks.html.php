<?php
	use n2n\impl\web\ui\view\html\HtmlView;
	use n2n\web\ui\view\View;
	use qs\bo\BlogArticle;
	
	$view = HtmlView::view($this);
	$html = HtmlView::html($view);
	 
	$blogArticle = $view->getParam('blogArticle');
	$view->assert($blogArticle instanceof BlogArticle);
	 
	$view->useTemplate('boilerplate.html', array('title' => 'Danke'));
?>
<h1>Kommentar erfasst</h1>
<p>Danke für deinen Kommentar</p>
<?php $html->linkToController($blogArticle->getUrlPart(), 'zurück zum Artikel') ?>