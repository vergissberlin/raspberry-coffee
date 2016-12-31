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

module.exports = {

		tasks: {
			options: {
				groups: {
					'Development': ['sync', 'availabletasks', 'default'],
					'Production':  ['deploy']
				}
			}
		}

};
