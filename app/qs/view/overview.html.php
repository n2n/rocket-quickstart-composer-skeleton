<?php
	use n2n\impl\web\ui\view\html\HtmlView;
	use n2n\web\ui\view\View;
	use qs\bo\BlogArticle;
	
	$view = HtmlView::view($this);
	$html = HtmlView::html($view);
	 
	// Blog Artikel aus den Parametern auslesen
	$blogArticles = $view->getParam('blogArticles');
	 
	$view->useTemplate('boilerplate.html', array('title' => 'Übersicht'));
?>
 
<h1>Unsere Blogartikel</h1>
 
<?php foreach ($blogArticles as $blogArticle): $view->assert($blogArticle instanceof BlogArticle) ?>
    <article>
        <h2><?php $html->out($blogArticle->getTitle()) ?></h2>
        <p><?php $html->out($blogArticle->getLead()) ?></p>
        <?php $html->linkToController($blogArticle->getUrlPart(), 'lesen') ?>
    </article>
<?php endforeach ?>