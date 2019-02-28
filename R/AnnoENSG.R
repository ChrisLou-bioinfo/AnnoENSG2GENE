AnnoENSG<-function(EntrzID=T,data=vsd.expr){ 
  vsd.expr<-data
  if (EntrzID==T){ 
    vsd.expr$ID<-stringr::str_sub(rownames(vsd.expr),end=15)
    vsd.exprG <- merge(annoENSG.entrz,vsd.expr,by="ID")
  }else{
    vsd.expr$ID<-stringr::str_sub(rownames(vsd.expr),end=15)
    vsd.exprG <- merge(anno.ENSG,vsd.expr,by="ID")
  }
  return(vsd.exprG)
}
