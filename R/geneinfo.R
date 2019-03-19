geneinfo<-function(selgene){
  require(annoE)
  anno<-annoE::anno.ENSG
  if(stringr::str_sub(selgene,end=4) %in% "ENSG"){
    selgene<-stringr::str_sub(selgene,end=15)
    geneinfo<-subset(anno,anno$ID==selgene)
  }else{
    geneinfo<-subset(anno,anno$SYMBOL==selgene)
  }
  return(geneinfo)
}
