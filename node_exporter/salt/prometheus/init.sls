{% set roles = pillar.get('roles', []) %}
{% if 'prometheus' in roles %}
prometheus pkgs:
  pkg.installed:
    - pkgs:
      - prometheus
      - prometheus-alertmanager

prometheus:
  service.running:
    - enable: True
    - watch:
      - file: /etc/prometheus/prometheus.yml
      - file: /etc/default/prometheus
      - file: /etc/prometheus/alert.rules
    - require:
      - pkg: prometheus pkgs

prometheus-alertmanager:
   service.running:
     - enable: True
     - watch:
       - file: /etc/prometheus/alertmanager.yml
     - reuqire:
       - pkg: prometheus pkgs

/etc/prometheus/prometheus.yml:
  file.managed:
    - source: salt://prometheus/files/prometheus.yml.j2
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
       - pkg: prometheus pkgs

/etc/default/prometheus:
  file.managed:
    - source: salt://prometheus/files/prometheus
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: prometheus pkgs

/etc/prometheus/alert.rules:
  file.managed:
    - source: salt://prometheus/files/alert.rules
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: prometheus pkgs

/etc/prometheus/alertmanager.yml:
  file.managed:
    - source: salt://prometheus/files/alertmanager.yml.j2
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
       - pkg: prometheus pkgs
{% endif %}


include:
  - prometheus.exporter
