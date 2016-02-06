#!/bin/bash                                                    

mkdir -p ./puppet/modules ./puppet/manifests ./puppet/hieradata
touch ./puppet/manifests/default.pp                            
cat > hiera.yaml <<EOF                                         
---                                                            
:backends:                                                     
  - yaml                                                       
:yaml:                                                         
  :datadir: "hieradata"                                        
:hierarchy:                                                    
  - "node/%{::hostname}"                                       
  - common                                                     
EOF                                                            
