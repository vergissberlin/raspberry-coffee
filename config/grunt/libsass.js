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
		options: {
    	sourcemap: true
    },
		dev {
			src: '<%= package.directories.public.css %>/style.css'
			dest: '<%= package.directories.private.scss %>/style.scss',
		}
};
