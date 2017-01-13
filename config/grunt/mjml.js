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

  options: {},
  prod: {
    files: [{
        expand: true,
        cwd: '<%= package.directories.private.views %>', // Src matches are relative to this path.
        src: ['**/*.mjml'], // Actual pattern(s) to match.
        dest: '<%= package.directories.public.views %>',   // Destination path prefix.
        ext: '.html',   // Dest filepaths will have this extension.
        extDot: 'first'   // Extensions in filenames begin after the first dot
      }]
  }

};
