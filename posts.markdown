---
layout: page
title: Blog
---

{% assign posts = site.posts %}

<ul class="post-list">
  {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
  {%- for post in posts -%}
    <li>
      <h3>
        <a class="post-link" href="{{ post.url | relative_url }}">
          {{ post.title | escape }}
        </a>
      </h3>
      <!-- prettier-ignore -->
      <div>
        {%- if site.show_excerpts -%} {{ post.excerpt }} {%- endif -%}
      </div>
    </li>
  {%- endfor -%}
</ul>
