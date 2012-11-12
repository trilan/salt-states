include:
  - apt

nodejs-ppa:
  cmd:
    - run
    - name: add-apt-repository -y ppa:chris-lea/node.js
    - unless: test -f /etc/apt/sources.list.d/chris-lea-node_js-{{ grains['oscodename'] }}.list

nodejs:
  pkg:
    - installed
    - names:
      - nodejs
      - npm
    - refresh: true
    - require:
      - cmd: nodejs-ppa
