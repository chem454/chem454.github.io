---
title: Weekly Summaries
layout: default
permalink: /weekly-summaries
nav_exclude: true
---


{% for post in site.posts %}
  <article class="post">

    <h1><a href="{{ site.url }}{{ post.url }}">{{ post.title }}</a></h1>

    <div class="entry">
      {{ post.excerpt }}
    </div>

    <a href="{{ site.url }}{{ post.url }}" class="read-more">Read More</a>
  </article>
{% endfor %}
  
