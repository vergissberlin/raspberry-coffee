/**
 * Grunt task configuration
 *
 * JavaScript ECMAScript 5.1
 *
 * @category  JavaScript
 * @package   AndreLademann\AndreLademannDe\Development
 * @project   AndreLademannDe
 * @author    André Lademann <info@andrelademann.de>
 * @copyright MIT
 * @license   https://opensource.org/licenses/MIT
 * @link      https://www.gnu.org/licenses/gpl.html
 */
'use strict';

module.exports = {

	// Watch file changes
	options: {
		nospawn:    true,
		livereload: 8484
	},

	configurations: {
		files: [
			'Gruntfile.js'
		],
		tasks: [
			'dev'
		]
	},

	scss: {
		options: {
			livereload: 8484
		},
		files:   [
			'<%= package.directories.private.scss %>/**/*.scss'
		],
		tasks:   [
			'sass',
			'csslint'
		]
	},

	views: {
		files:   [
			'<%= package.directories.private.views %>/*.mjml',
			'<%= package.directories.private.views %>/**/*.mjml'
		],
		options: {
			livereload: 8484
		}
	}

};
