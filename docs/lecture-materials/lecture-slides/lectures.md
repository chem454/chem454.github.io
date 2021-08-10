---
layout: default
title: Lecture Slides
nav_order: 14
permalink: /lecture/slides
has_toc: false
parent: Lecture Materials
last_modified_date: 2021-08-08
---

# Lecture Slides
{: .no_toc  }

----

If there are slides available for a lecture they will be listed here.

*This list may update throughout the semester.*

<div>
<ul>
{% for file in site.static_files %}
  {% if file.path contains "lecture-slides" and file.extname == ".html" %}
   <li> <a href = "{{ site.url }}{{ file.path }}">{{ file.path | replace:'.html','' | replace: '/docs/lecture-materials/lecture-slides/', '' | replace: '-', ' ' }}</a> </li>
  {% endif %}
{% endfor %}
</ul>
</div>

<!-- {% assign sorted_pages = site.html_pages | sort:"lesson" %}

<div class="post-list">
    {% for page in sorted_pages %}
        {% if page.category == "c370_lecture" %}
            <li><a href="{{ site.baseurl }}{{ page.url }}"> {{ page.title }} </a></li>
        {% endif %}
    {% endfor %}
</div> -->

-------

***Copyright Statement***

*The lectures here are available for re-use under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/). You may re-use this material under the conditions that you (1) attribute the author, (2) do not use it for commercial or for-profit purposes, and (3) share it under an equally-permissive license.  Please [contact](mailto:difscher@wcu.edu) the author for inquiries about other usage.  Take note that some of the materials referenced in this book might be under different copyright protection — if so, this will be indicated in the text.*

*I have tried to acknowledge all sources. If I have forgotten to acknowledge your work, have provided insufficient credits, or have misinterpreted your copyright, it has not been done with malicious intent. Please [notify me](mailto:difscher@wcu.edu) of any concerns.*

*Some lectures draw heavily on* Analytical Chemistry 2.1 *by David Harvey, available via [LibreTexts](https://chem.libretexts.org/Bookshelves/Analytical_Chemistry/Book%3A_Analytical_Chemistry_2.1_%28Harvey%29/01%3A_Introduction_to_Analytical_Chemistry/1.01%3A_What_is_Analytical_Chemistry).*

*These slides were created using [remark](https://remarkjs.com/).*
