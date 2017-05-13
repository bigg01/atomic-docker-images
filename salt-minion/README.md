# Atomic salt-minion container managed by systemd


```

# create service and enable it
```
$ cp  etc_sysconfig_salt-minion /etc/sysconfig/salt-minion
$ vi /etc/systemd/system/salt-minion.service
$ vi /etc/sysconfig/salt-minion

 $ sudo systemctl daemon-reload
 $ sudo systemctl enable salt-minion
 $ sudo systemctl start salt-minion
```


```
chcon system_u:object_r:rpm_exec_t:s0 /usr/bin/salt-minion
chcon system_u:object_r:rpm_exec_t:s0 /usr/bin/salt-call
```




```
/usr/bin/docker run -it -p 4506:4506 -p 4505:4505  -v /etc/salt/:/etc/salt/ --rm --privileged --net=host --name salt-minion guo/salt-minion:latest bash
[INFO    ] Setting up the Salt Minion "atomic25.home"
[ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
[INFO    ] Waiting 10 seconds before retry.

[ERROR   ] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate
[INFO    ] Waiting 10 seconds before retry.
[INFO    ] Executing command ['date', '+%z'] in directory '/root'
[INFO    ] Added mine.update to scheduler
[INFO    ] Added new job __mine_interval to scheduler
```

```

sudo salt-key -A -y
The following keys are going to be accepted:
Unaccepted Keys:
atomic25.home
Key for minion atomic25.home accepted.
$ sudo salt atomic25.home grains.items
atomic25.home:
    Minion did not return. [Not connected]
$ sudo salt atomic25.home grains.items
atomic25.home:
    ----------
    SSDs:
    cpu_flags:
        - fpu
        - vme
        - de
        - pse
        - tsc
        - msr
        - pae
        - mce
        - cx8
        - apic
        - sep
        - mtrr
        - pge
        - mca
        - cmov
        - pat
        - pse36
        - clflush
        - mmx
        - fxsr
        - sse
        - sse2
        - syscall
        - nx
        - rdtscp
        - lm
        - constant_tsc
        - rep_good
        - nopl
        - xtopology
        - nonstop_tsc
        - pni
        - pclmulqdq
        - monitor
        - ssse3
        - cx16
        - sse4_1
        - sse4_2
        - movbe
        - popcnt
        - aes
        - xsave
        - avx
        - rdrand
        - hypervisor
        - lahf_lm
        - abm
    cpu_model:
        Intel(R) Core(TM) i7-4870HQ CPU @ 2.50GHz
    cpuarch:
        x86_64
    domain:
        home
    fqdn:
        atomic25.home
    fqdn_ip4:
        - 10.0.0.225
    fqdn_ip6:
    gpus:
        |_
          ----------
          model:
              VirtualBox Graphics Adapter
          vendor:
              unknown
    host:
        atomic25
    hwaddr_interfaces:
        ----------
    id:
        atomic25.home
    init:
        unknown
    ip4_interfaces:
        ----------
    ip6_interfaces:
        ----------
    ip_interfaces:
        ----------
    ipv4:
    ipv6:
    kernel:
        Linux
    kernelrelease:
        3.10.0-514.6.1.el7.x86_64
    locale_info:
        ----------
        defaultencoding:
            None
        defaultlanguage:
            None
        detectedencoding:
            ANSI_X3.4-1968
    localhost:
        atomic25
    lsb_distrib_id:
        CentOS Linux
    machine_id:
    master:
        10.0.0.4
    mdadm:
    mem_total:
        2000
    nodename:
        atomic25
    num_cpus:
        1
    num_gpus:
        1
    os:
        CentOS
    os_family:
        RedHat
    osarch:
        x86_64
    oscodename:
        Core
    osfinger:
        CentOS Linux-7
    osfullname:
        CentOS Linux
    osmajorrelease:
        7
    osrelease:
        7.3.1611
    osrelease_info:
        - 7
        - 3
        - 1611
    path:
        /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    ps:
        ps -efH
    pythonexecutable:
        /usr/bin/python
    pythonpath:
        - /usr/bin
        - /usr/lib64/python27.zip
        - /usr/lib64/python2.7
        - /usr/lib64/python2.7/plat-linux2
        - /usr/lib64/python2.7/lib-tk
        - /usr/lib64/python2.7/lib-old
        - /usr/lib64/python2.7/lib-dynload
        - /usr/lib64/python2.7/site-packages
        - /usr/lib/python2.7/site-packages
    pythonversion:
        - 2
        - 7
        - 5
        - final
        - 0
    saltpath:
        /usr/lib/python2.7/site-packages/salt
    saltversion:
        2015.5.10
    saltversioninfo:
        - 2015
        - 5
        - 10
        - 0
    server_id:
        1092768574
    shell:
        /bin/sh
    systemd:
        ----------
        features:
            +PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID +ELFUTILS +KMOD +IDN
        version:
            219
    virtual:
        VirtualBox
    zmqversion:
        3.2.5
