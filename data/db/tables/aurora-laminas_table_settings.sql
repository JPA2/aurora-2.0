
-- --------------------------------------------------------

--
-- Table structure for table `settings`
--
-- Creation: Feb 12, 2022 at 08:10 PM
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  `label` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `variable` (`variable`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `settings`
--

TRUNCATE TABLE `settings`;
--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`, `settingType`, `label`) VALUES
(1, 'allowedTags', '<h1>,<h2>,<h3>,<h4>,<h5>,<h6>,<hr>', 'text', 'Allowed Tags'),
(2, 'enableCaptcha', '1', 'Checkbox', 'Enable Captcha Support'),
(3, 'recaptchaPrivateKey', '6Lewcs0SAAAAAGfBkJsG1mxf-yGFUjq9JgglSwRL', 'text', 'Recaptcha Private Key'),
(4, 'recaptchaPrivateKey', '6Lewcs0SAAAAAGfBkJsG1mxf-yGFUjq9JgglSwRL', 'text', 'Recaptcha Public Key'),
(5, 'seoKeyWords', 'Aurora CMS, Webinertia.net, Php, MySQL', 'text', 'SEO Key Words'),
(6, 'appName', 'ACMS', 'Text', 'Application Name'),
(7, 'smtpSenderAddress', '', 'Text', 'SMTP Sender Email'),
(8, 'smtpSenderPasswd', '', 'Text', 'SMTP Sender Password'),
(9, 'appContactEmail', 'jsmith@webinertia.net', 'Text', 'Website Contact Email'),
(10, 'enableMobileSupport', '1', 'CheckBox', 'Enable Mobile App support'),
(11, 'seoDescription', 'A Content Management System', 'text', 'SEO Description'),
(12, 'facebookAppId', '431812843521907', 'Text', 'Facebook App ID'),
(13, 'faceBookSecretKey', 'd86702c59bd48f3a76bc57d923cd237e', 'Text', 'Facebook App Secret Key'),
(14, 'enableFacebookPageLink', '1', 'CheckBox', 'Enable Facebook Page Link'),
(15, 'enableFacebookOg', '0', 'Checkbox', 'Enable Facebook Open Graph Support'),
(16, 'sessionLength', '86400', 'Text', 'Session Length (default is 1 day)'),
(17, 'enableOnlineList', '1', 'Checkbox', 'Enable Online List'),
(18, 'enableErrorLogging', '1', 'Checkbox', 'Enable Error Logging'),
(19, 'enableHomeTab', '1', 'Checkbox', 'Enable Home Menu Tab'),
(20, 'enableLinkedLogo', '1', 'Checkbox', 'Enable Linked Logo'),
(21, 'disableLogin', '0', 'checkbox', 'Disable User Login'),
(22, 'disableRegistration', '1', 'checkbox', 'Disable Registration'),
(23, 'timeFormat', 'm-j-Y g:i:s', 'text', 'Time Format (Month:Day:Year:Hr:Min:sec)'),
(24, 'timeZone', 'America/Chicago', 'text', 'Time Zone'),
(25, 'copyRightText', 'A Content Management Test', 'text', 'Site Copyright Text'),
(26, 'copyRightLink', 'http://webinertia.net/acms', 'text', 'Copyright Link (If any)'),
(27, 'footerText', 'Developed by @Tyrsson', 'text', 'Footer Text (Next to copyright)'),
(28, 'firebugDebug', '1', 'checkbox', 'Enable Firebug Debug Logger?'),
(29, 'enableTranslation', '0', 'checkbox', 'Enable Translation'),
(30, 'enableContactUs', '1', 'checkbox', 'Enable Contact Form');
