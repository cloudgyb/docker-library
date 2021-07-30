# create engine-log_component_template
curl -XPUT 'http://localhost:9200/_component_template/engine-log_component_template' \
-H 'Content-Type: application/json' \
-d '{
    "template": {
        "mappings": {
            "properties": {
                "engineId": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "ignore_above": 256
                        }
                    }
                },
                "ip": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "ignore_above": 256
                        }
                    }
                },
                "level": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "ignore_above": 256
                        }
                    }
                },
                "message": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "ignore_above": 256
                        }
                    }
                },
                "timestamp": {
                    "type": "date"
                }
            }
        }
    }
}'

# create protective-log_component_template
curl -XPUT 'http://localhost:9200/_component_template/protective-log_component_template' \
-H 'Content-Type: application/json' \
-d '{
    "template": {
        "mappings": {
            "properties": {
                "method": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "level": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "ip": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "module": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "responseHeader": {
                    "properties": {
                        "date": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "content-length": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "server": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "transfer-encoding": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "content-encoding": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "p3p": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "last-modified": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "set-cookie": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "keep-alive": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "connection": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "content-type": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "etag": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "location": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "accept-ranges": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "cache-control": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        }
                    }
                },
                "requsetHeader": {
                    "properties": {
                        "referer": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "if-none-match": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "accept-language": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "cookie": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "x-forwarded-for": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "pragma": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "accept": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "x-real-ip": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "if-modified-since": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "host": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "upgrade-insecure-requests": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "connection": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "cache-control": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "accept-encoding": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "user-agent": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        }
                    }
                },
                "ipInfo": {
                    "properties": {
                        "Area": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "ip": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "latitude": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "Country": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        },
                        "int": {
                            "type": "long"
                        },
                        "longitude": {
                            "type": "text",
                            "fields": {
                                "keyword": {
                                    "ignore_above": 256,
                                    "type": "keyword"
                                }
                            }
                        }
                    }
                },
                "message": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "statusMessage": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "url": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "protocol": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "delay": {
                    "type": "long"
                },
                "httpVersion": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "requsetBody": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "browser": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "host": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "serverIp": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "engineId": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    }
                },
                "statusCode": {
                    "type": "long"
                },
                "timestamp": {
                    "type": "date"
                }
            }
        }
    }
}'

# create protective-log_index_template
curl -XPUT 'http://localhost:9200/_index_template/protective-log_index_template' \
-H 'Content-Type: application/json' \
-d '{
  "index_patterns": ["protective-log_*"],
  "template": {
    "settings": {
      "number_of_shards": 1
    },
    "mappings": {
      "_source": {
        "enabled": true
      }
    },
    "aliases": {
      "protective-log": { }
    }
  },
  "priority": 500,
  "composed_of": ["protective-log_component_template"],
  "version": 3,
  "_meta": {
    "description": "protective-log index template"
  }
}'

# create engine-log_index_template
curl -XPUT 'http://localhost:9200/_index_template/engine-log_index_template' \
-H 'Content-Type: application/json' \
-d '{
    "index_patterns": [
        "engine-log_*"
    ],
    "template": {
        "settings": {
            "index": {
                "number_of_shards": "1"
            }
        },
        "mappings": {
            "_source": {
                "enabled": true
            }
        },
        "aliases": {
            "engine-log": {}
        }
    },
    "composed_of": [
        "engine-log_component_template"
    ],
    "priority": 500,
    "version": 3,
    "_meta": {
        "description": "engine-log index template"
    }
}'