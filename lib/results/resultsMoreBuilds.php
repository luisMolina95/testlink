<?php
/** 
* TestLink Open Source Project - http://testlink.sourceforge.net/ 
* $Id: resultsMoreBuilds.php,v 1.2 2005/09/01 20:39:06 schlundus Exp $ 
*
* @author	Kevin Levy <kevinlevy@users.sourceforge.net>
* 
* This page will forward the user to a form where they can select
* the builds they would like to query results against.
*
*/
require('../../config.inc.php');
require_once('common.php');
require_once('builds.inc.php');
testlinkInitPage();

$arrBuilds = getBuilds($_SESSION['testPlanId']); // get Builds
$smarty = new TLSmarty();
$smarty->assign('testPlanName',$_SESSION['testPlanName']);
$smarty->assign('projectid', $_SESSION['project']);
$smarty->assign('arrBuilds', $arrBuilds); 
$smarty->display('resultsMoreBuilds_query_form.tpl');
?>