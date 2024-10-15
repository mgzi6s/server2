[
    {
        "remarks": "God 01",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "server2-bnl.pages.dev",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/JGU1UrYu68SSHWsI?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "seRvER2-Bnl.pAGes.DEV"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 02",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "www.speedtest.net",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/f4zwPR2GKlb3SyAX?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "sErVer2-BNL.PaGEs.dev"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 03",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "188.114.96.3",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/VEZy4uXwPUtBvm1y?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "serveR2-BNl.PAgeS.dEV"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 04",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "188.114.97.3",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/pl8lMP6qShbsDtwW?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SeRveR2-BNL.PaGEs.dev"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 05",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "[2a06:98c1:3120::3]",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/jvfx99tBcDnsH4QU?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "servER2-BNl.paGeS.dev"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 06",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "[2a06:98c1:3121::3]",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/Vc5tLOq3XHaaE6KR?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErver2-BNl.pAGEs.dev"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 07",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "104.25.162.106",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/5zlgInwNkyPPA4p1?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErvEr2-bNL.Pages.DeV"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 08",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "104.19.78.120",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/Z63p5eJZ1ht8SumU?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErveR2-bNL.pAgeS.DEV"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 09",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "server2-bnl.pages.dev",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/muVTjHaswGaVJEN1?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "sERvEr2-BNL.PagEs.deV"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 10",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "www.speedtest.net",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/gnpuYGBthS2wn5ak?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "servER2-BnL.pagES.DEV"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 11",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "188.114.96.3",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/9fLO19N2w5xh1CUa?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErvEr2-bnl.PAGEs.dev"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 12",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "188.114.97.3",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/5tvVnfgowejOcaXU?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "seRver2-BNL.paGEs.DEV"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 13",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "[2a06:98c1:3120::3]",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/G7ud4xeRvkjDo4r7?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErVeR2-bNl.paGEs.Dev"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 14",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "[2a06:98c1:3121::3]",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/G3ay8AwQB4sy1hoe?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "sErveR2-BnL.pagES.DEV"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 15",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "104.25.162.106",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/V5vh5xR76vAuocGP?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "sErVEr2-BNL.pAGES.Dev"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 16",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "104.19.78.120",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/QvbHcF1zOSfCAP6n?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SeRver2-bNl.PaGes.dev"
                    }
                },
                "tag": "proxy"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "outboundTag": "proxy",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    },
    {
        "remarks": "God 17",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "server2-bnl.pages.dev",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/JGU1UrYu68SSHWsI?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "seRvER2-Bnl.pAGes.DEV"
                    }
                },
                "tag": "prox-1"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "www.speedtest.net",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/f4zwPR2GKlb3SyAX?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "sErVer2-BNL.PaGEs.dev"
                    }
                },
                "tag": "prox-2"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "188.114.96.3",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/VEZy4uXwPUtBvm1y?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "serveR2-BNl.PAgeS.dEV"
                    }
                },
                "tag": "prox-3"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "188.114.97.3",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/pl8lMP6qShbsDtwW?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SeRveR2-BNL.PaGEs.dev"
                    }
                },
                "tag": "prox-4"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "[2a06:98c1:3120::3]",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/jvfx99tBcDnsH4QU?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "servER2-BNl.paGeS.dev"
                    }
                },
                "tag": "prox-5"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "[2a06:98c1:3121::3]",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/Vc5tLOq3XHaaE6KR?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErver2-BNl.pAGEs.dev"
                    }
                },
                "tag": "prox-6"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "104.25.162.106",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/5zlgInwNkyPPA4p1?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErvEr2-bNL.Pages.DeV"
                    }
                },
                "tag": "prox-7"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "104.19.78.120",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/Z63p5eJZ1ht8SumU?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErveR2-bNL.pAgeS.DEV"
                    }
                },
                "tag": "prox-8"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "server2-bnl.pages.dev",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/muVTjHaswGaVJEN1?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "sERvEr2-BNL.PagEs.deV"
                    }
                },
                "tag": "prox-9"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "www.speedtest.net",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/gnpuYGBthS2wn5ak?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "servER2-BnL.pagES.DEV"
                    }
                },
                "tag": "prox-10"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "188.114.96.3",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/9fLO19N2w5xh1CUa?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErvEr2-bnl.PAGEs.dev"
                    }
                },
                "tag": "prox-11"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "188.114.97.3",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/5tvVnfgowejOcaXU?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "seRver2-BNL.paGEs.DEV"
                    }
                },
                "tag": "prox-12"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "[2a06:98c1:3120::3]",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/G7ud4xeRvkjDo4r7?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SErVeR2-bNl.paGEs.Dev"
                    }
                },
                "tag": "prox-13"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "[2a06:98c1:3121::3]",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/G3ay8AwQB4sy1hoe?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "sErveR2-BnL.pagES.DEV"
                    }
                },
                "tag": "prox-14"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "104.25.162.106",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/V5vh5xR76vAuocGP?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "sErVEr2-BNL.pAGES.Dev"
                    }
                },
                "tag": "prox-15"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "104.19.78.120",
                            "port": 2053,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true,
                        "dialerProxy": "fragment"
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/QvbHcF1zOSfCAP6n?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "SeRver2-bNl.PaGes.dev"
                    }
                },
                "tag": "prox-16"
            },
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "balancerTag": "all",
                    "type": "field"
                }
            ],
            "balancers": [
                {
                    "tag": "all",
                    "selector": [
                        "prox"
                    ],
                    "strategy": {
                        "type": "leastPing"
                    }
                }
            ]
        },
        "observatory": {
            "probeInterval": "30s",
            "probeURL": "https://www.gstatic.com/generate_204",
            "subjectSelector": [
                "prox"
            ],
            "EnableConcurrency": true
        },
        "stats": {}
    },
    {
        "remarks": "God 18",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ]
            },
            "servers": [
                "https://8.8.8.8/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "server2-bnl.pages.dev",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "sockopt": {
                        "tcpNoDelay": true
                    },
                    "wsSettings": {
                        "headers": {
                            "Host": "server2-bnl.pages.dev",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/JGU1UrYu68SSHWsI?ed=2560"
                    },
                    "tlsSettings": {
                        "allowInsecure": false,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "seRvER2-Bnl.pAGes.DEV"
                    }
                },
                "tag": "proxy"
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            },
            {
                "tag": "frag-1",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-20",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-2",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "20-30",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-3",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "30-40",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-4",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "40-50",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-5",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "50-60",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-6",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "60-70",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-7",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "70-80",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-8",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "80-90",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-9",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "90-100",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-10",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-11",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "20-40",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-12",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "30-50",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-13",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "40-60",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-14",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "50-70",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-15",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "60-80",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-16",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "70-90",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-17",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "80-100",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            },
            {
                "tag": "frag-18",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "100-200",
                        "interval": "1-1"
                    }
                },
                "proxySettings": {
                    "tag": "proxy"
                }
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp",
                    "balancerTag": "all",
                    "type": "field"
                }
            ],
            "balancers": [
                {
                    "tag": "all",
                    "selector": [
                        "frag"
                    ],
                    "strategy": {
                        "type": "leastPing"
                    }
                }
            ]
        },
        "observatory": {
            "probeInterval": "30s",
            "probeURL": "https://www.gstatic.com/generate_204",
            "subjectSelector": [
                "frag"
            ],
            "EnableConcurrency": true
        },
        "stats": {}
    },
    {
        "remarks": "God 19",
        "log": {
            "loglevel": "warning"
        },
        "dns": {
            "hosts": {
                "domain:googleapis.cn": [
                    "googleapis.com"
                ],
                "cloudflare-dns.com": [
                    "104.16.248.249",
                    "104.16.249.249",
                    "104.16.133.229",
                    "104.16.132.229",
                    "104.17.147.22",
                    "104.17.148.22",
                    "108.162.193.103",
                    "173.245.59.103",
                    "172.64.33.103",
                    "108.162.192.128",
                    "172.64.32.128",
                    "173.245.58.128"
                ]
            },
            "servers": [
                "https://cloudflare-dns.com/dns-query"
            ],
            "tag": "dns"
        },
        "inbounds": [
            {
                "port": 10808,
                "protocol": "socks",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "socks-in"
            },
            {
                "port": 10809,
                "protocol": "http",
                "settings": {
                    "auth": "noauth",
                    "udp": true,
                    "userLevel": 8
                },
                "sniffing": {
                    "destOverride": [
                        "http",
                        "tls"
                    ],
                    "enabled": true,
                    "routeOnly": true
                },
                "tag": "http-in"
            },
            {
                "listen": "127.0.0.1",
                "port": 10853,
                "protocol": "dokodemo-door",
                "settings": {
                    "address": "1.1.1.1",
                    "network": "tcp,udp",
                    "port": 53
                },
                "tag": "dns-in"
            }
        ],
        "outbounds": [
            {
                "tag": "fragment",
                "protocol": "freedom",
                "settings": {
                    "fragment": {
                        "packets": "tlshello",
                        "length": "10-30",
                        "interval": "1-1"
                    },
                    "domainStrategy": "UseIP"
                },
                "streamSettings": {
                    "sockopt": {
                        "tcpKeepAliveIdle": 100,
                        "tcpNoDelay": true
                    }
                }
            },
            {
                "protocol": "dns",
                "tag": "dns-out"
            },
            {
                "protocol": "freedom",
                "settings": {
                    "domainStrategy": "UseIP"
                },
                "tag": "direct"
            },
            {
                "protocol": "blackhole",
                "settings": {
                    "response": {
                        "type": "http"
                    }
                },
                "tag": "block"
            },
            {
                "protocol": "vless",
                "settings": {
                    "vnext": [
                        {
                            "address": "google.com",
                            "port": 443,
                            "users": [
                                {
                                    "encryption": "none",
                                    "flow": "",
                                    "id": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                                    "level": 8,
                                    "security": "auto"
                                }
                            ]
                        }
                    ]
                },
                "streamSettings": {
                    "network": "ws",
                    "security": "tls",
                    "wsSettings": {
                        "headers": {
                            "Host": "89b3cbba-e6ac-485a-9481-976a0415eab9",
                            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
                        },
                        "path": "/"
                    },
                    "tlsSettings": {
                        "allowInsecure": true,
                        "fingerprint": "randomized",
                        "alpn": [
                            "h2",
                            "http/1.1"
                        ],
                        "serverName": "google.com"
                    }
                },
                "tag": "fake-outbound"
            }
        ],
        "policy": {
            "levels": {
                "8": {
                    "connIdle": 300,
                    "downlinkOnly": 1,
                    "handshake": 4,
                    "uplinkOnly": 1
                }
            },
            "system": {
                "statsOutboundUplink": true,
                "statsOutboundDownlink": true
            }
        },
        "routing": {
            "domainStrategy": "IPIfNonMatch",
            "rules": [
                {
                    "inboundTag": [
                        "dns-in"
                    ],
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "inboundTag": [
                        "socks-in",
                        "http-in"
                    ],
                    "port": "53",
                    "outboundTag": "dns-out",
                    "type": "field"
                },
                {
                    "network": "tcp,udp",
                    "outboundTag": "fragment",
                    "type": "field"
                }
            ]
        },
        "stats": {}
    }
]
