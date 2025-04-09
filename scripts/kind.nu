#!/usr/bin/env nu

#
# Functions
#

def cluster_create [name: string] {
  kind create cluster -n ($name)
}

def cluster_list [] {
  kind get clusters
}

def cluster_delete [name: string] {
  kind delete clusters ($name)
}

# 
# Main
#

# KinD Cluster Management. 
def "main kind" [] {}

# Create a KinD cluster named <name>.
def "main kind create" [
  name: string # The name of the cluster you want to create.
] {
  cluster_create ($name)
}

# List KinD clusters.
def "main kind list" [] {
  cluster_list
}

# Delete a KinD cluster named <name>.
def "main kind delete" [
  --name = "" : string # The name of the cluster you want to delete. If no name is provided, you will be presented with a menu of available clusters to delete.
] {
  if ($name) == "" {
    mut num: int = 1
    let clusters = kind get clusters | lines

    print "Please select the cluster you wish to delete: \n"
    for cluster_name in ($clusters) {
      print $"($num)) ($cluster_name)"
      $num += 1
    }

    let is_list_not_empty: bool = $clusters | is-not-empty  

    if $is_list_not_empty {
      print "\nPlease select the number of the cluster you'd like to delete."
      let cluster_number = (input)
      let cluster_index = ($cluster_number | into int) - 1
      
      kind delete clusters ($clusters | get $cluster_index)
    } else {
      print "\nNo clusters available to delete."
    }
  } else {
    cluster_delete ($name)
  }
}
