; $Id$
;
; Example makefile
; ----------------
; This is an example makefile to introduce new users of drush_make to the
; syntax and options available to drush_make. For a full description of all
; options available, see README.txt.

; This make file is a working makefile - try it! Any line starting with a `;`
; is a comment.

; Core version
; ------------
; Each makefile should begin by declaring the core version of Drupal that all
; projects should be compatible with.

core = 7.x

; API version
; ------------
; Every makefile needs to declare it's Drush Make API version. This version of
; drush make uses API version `2`.

api = 2

; Core project
; ------------
; In order for your makefile to generate a full Drupal site, you must include
; a core project. This is usually Drupal core, but you can also specify
; alternative core projects like Pressflow. Note that makefiles included with
; install profiles *should not* include a core project.

; Use pressflow instead of Drupal core:
; projects[pressflow][type] = "core"
; projects[pressflow][download][type] = "file"
; projects[pressflow][download][url] = "http://launchpad.net/pressflow/6.x/6.15.73/+download/pressflow-6.15.73.tar.gz"

projects[] = drupal

; Projects
; --------
; Each project that you would like to include in the makefile should be
; declared under the `projects` key. The simplest declaration of a project
; looks like this:

; To include the most recent views module:

; projects[] = views

; This will, by default, retrieve the latest recommended version of the project
; using its update XML feed on Drupal.org. If any of those defaults are not
; desirable for a project, you will want to use the keyed syntax combined with
; some options.

; If you want to retrieve a specific version of a project:

; projects[cck] = 2.6

; Or an alternative, extended syntax:

; projects[ctools][version] = 1.3

; Clone a project from github.

; projects[tao][type] = theme
; projects[tao][download][type] = git
; projects[tao][download][url] = git://github.com/developmentseed/tao.git

; If you want to install a module into a sub-directory, you can use the
; `subdir` attribute.

; projects[admin_menu][subdir] = custom

; To apply a patch to a project, use the `patch` attribute and pass in the URL
; of the patch.

; projects[admin_menu][patch][] = "http://drupal.org/files/issues/admin_menu.long_.31.patch"


projects[] = examples
projects[] = filefield_nginx_progress

projects[libraries] = 2.2
projects[captcha] = 1.2
projects[features] = 1.0
projects[] = module_builder
projects[] = token
projects[ctools] = 1.6
projects[filefield_sources] = 1.9
projects[nice_menus] = 2.5
projects[views] = 3.10
projects[filefield_sources_plupload] = 1.x-dev
projects[panels] = 3.5
projects[views_slideshow] = 3.1
projects[] = devel
; projects[] = frontpage_slider
projects[pathauto] = 1.2
projects[views_slideshow_galleria] = 3.2
projects[draggableviews] = 2.0
projects[] = google_analytics
projects[plupload] = 1.7
projects[webform] = 3.21
projects[imce] = 1.9
projects[] = recaptcha
projects[wysiwyg] = 2.2
projects[entity] = 1.5
projects[imce_wysiwyg] = 1.0
projects[superfish] = 1.9
projects[] = robotstxt
projects[entitycache] = 1.2
projects[] = boost
projects[] = expire

