<?php
	use n2n\impl\web\ui\view\html\HtmlView;
	use n2n\web\ui\view\View;
	use n2n\core\N2N;
	
	// 1. Objekte der View: nicht zwingend notwendig
	$view = HtmlView::view($this);
	$html = HtmlView::html($view);
	$request = HtmlView::request($view);
	 
	// 2. Auslesen des Titels und der Beschreibung
	$title = $view->getParam('title', false, 'Example');
	$description = $view->getParam('description', false);
	 
	// 3. Abfüllen der Tags im Header Bereich
	$html->meta()->setTitle($title);
	$html->meta()->addMeta(array('charset' => N2N::CHARSET));
	if (null !== $description) {
		$html->meta()->addMeta(array('name' => 'description', 'content' => $description));
	}
?>
<!doctype html>
<html lang="<?php $html->out($request->getN2nLocale()->getId())?>">
    <?php $html->headStart() ?>
    <?php $html->headEnd() ?>
    <?php $html->bodyStart() ?>
     
        <?php $view->importContentView() ?>
         
    <?php $html->bodyEnd() ?>
</html>