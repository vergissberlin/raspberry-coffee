/**
 * Grunt task configuration
 *
 * JavaScript ECMAScript 5.1
 *
 * @category  JavaScript
 * @package   AndreLademann\RaspberryCoffee\Development
 * @project   RaspberryCoffee
 * @author    André Lademann <vergissberlin@googlemail.com>
 * @copyright MIT
 * @license   https://opensource.org/licenses/MIT
 * @link      https://www.gnu.org/licenses/gpl.html
 */
'use strict';

module.exports = function (grunt) {
	var path = require('path');

	require('time-grunt')(grunt);
	require('load-grunt-config')(grunt, {
		configPath: path.join(process.cwd(), 'config/grunt'),
		init:       true,

		jitGrunt: {
			staticMappings: {
				availabletasks: 'grunt-available-tasks',
				exec: 					'grunt-exec',
				mjml: 					'grunt-mjml',
				libsass:           'grunt-libsass',
				scsslint:       'grunt-scss-lint'
			}
		},
		data:     {
			path: path
		}
	});

};
