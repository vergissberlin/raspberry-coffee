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

	login: 'resin login --web',
	sync: 'resin sync --source . --destination /usr/src/app',
  deploy: 'git push resin master'

};
