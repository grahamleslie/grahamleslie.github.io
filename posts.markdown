---
layout: page
title: Blog
---

{% assign posts = site.posts %}

{%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
{%- for post in posts -%}

  <div>
    <h3>
      <a class="post-link" href="{{ post.url | relative_url }}">
        {{ post.title | escape }}
      </a>
    </h3>
  <div>
    {%- if site.show_excerpts -%}
      {{ post.excerpt }}
    {%- endif -%}
  </div>
{%- endfor -%}
