{% for locale in pillar.get('locales', ()) %}
locale-gen {{ locale }}:
  cmd:
    - run
    - order: 0
{% endfor %}

{% set default_locale = pillar.get('locales.default', 'en_US.UTF-8') %}
update-locale LANG={{ default_locale }} LC_ALL={{ default_locale }}:
  cmd:
    - run
    - order: 0
