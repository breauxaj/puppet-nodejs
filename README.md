nodejs
======

Node.js is a platform built on Chrome's JavaScript runtime for easily building
fast, scalable network applications. Node.js uses an event-driven, non-blocking
I/O model that makes it lightweight and efficient, perfect for data-intensive
real-time applications that run across distributed devices.

Samples
-------
```
include nodejs
```
```
nodejs::service { 'default': ensure => running, enable => true }
```
```
nodejs::instance { 'default':
  user  => 'deploy',
  group => 'deploy',
  path  => '/var/nodes',
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
