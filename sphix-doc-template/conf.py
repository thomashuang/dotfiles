# -*- coding: utf-8 -*-
import pkg_resources

version = release =  "0.1"

extensions = ['sphinx.ext.autodoc']

source_suffix = '.rst' # The suffix of source filenames.
master_doc = 'index' # The master toctree document.

project = '$project'
copyright = '2015, Thomas and contributors'
exclude_patterns = ['jsonrpc-example-code/*']


import sphinx_rtd_theme

html_theme = "sphinx_rtd_theme"
html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

#html_theme = "haiku"
# html_theme_options = {
#     "rightsidebar": "true",
#     "relbarbgcolor": "black"
# }


modindex_common_prefix = ['demo.']

# If true, '()' will be appended to :func: etc. cross-reference text.
#add_function_parentheses = True

# If true, the current module name will be prepended to all description
# unit titles (such as .. function::).
#add_module_names = True


# html_favicon = ...
html_add_permalinks = False
#html_show_sourcelink = True # ?set to False?

# Content template for the index page.
#html_index = ''

# Custom sidebar templates, maps document names to template names.
#html_sidebars = {}

# Output file base name for HTML 