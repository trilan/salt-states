{% for name in pillar.get('packages', ()) %}
{{ name }}:
  pkg:
    - installed
    - order: 0
{% endfor %}
