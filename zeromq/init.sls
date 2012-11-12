include:
  - apt

zeromq-ppa:
  cmd:
    - run
    - name: add-apt-repository -y ppa:chris-lea/zeromq
    - unless: test -f /etc/apt/sources.list.d/chris-lea-zeromq-{{ grains['oscodename'] }}.list

zeromq:
  pkg:
    - installed
    - names:
      - libzmq1
      - libzmq-dev
    - refresh: true
    - require:
      - cmd: zeromq-ppa
