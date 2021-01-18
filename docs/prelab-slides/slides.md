---
layout: default
title: Prelab Slides
nav_order: 10
permalink: /slides/
last_modified_date: 2020-12-05
---

# Prelab Lecture Slides
{: .no_toc  }

----

<div>
<ul>
{% for file in site.static_files %}
  {% if file.path contains "prelab-slides" and file.extname == ".html" %}
   <li> <a href = "{{ site.url }}{{ file.path }}">{{ file.path | replace:'.html','' | replace: '/docs/prelab-slides/', '' | replace: '-', ' ' }}</a> </li>
  {% endif %}
{% endfor %}
</ul>
</div>


***Copyright Statement***

*The lectures here are available for re-use under a [Creative Commons Attribution NonCommercial ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/). You may re-use this material under the conditions that you (1) attribute the author, (2) do not use it for commercial or for-profit purposes, and (3) share it under an equally-permissive license.  Please [contact](mailto:difscher@wcu.edu) the author for inquiries about other usage.  Take note that some of the materials referenced in this book might be under different copyright protection — if so, this will be indicated in the text.*

*I have tried to acknowledge all sources. If I have forgotten to acknowledge your work, have provided insufficient credits, or have misinterpreted your copyright, it has not been done with malicious intent. Please [notify me](mailto:difscher@wcu.edu) of any concerns.*

These slides were created using [remark](https://remarkjs.com/).
