AnnoENSG<-function(EntrezID=F,col="rownames",data=vsd.expr){ 
  vsd.expr<-data
  if (EntrezID==T){
    anno<-annoENSG.entrz
  }else{
    anno<-anno.ENSG
  }
  if (col=="rownames"){
    vsd.expr$ID<-stringr::str_sub(rownames(vsd.expr),end=15)
    vsd.exprG <- merge(anno,vsd.expr,by="ID")
  }else{
    vsd.expr$ID<-stringr::str_sub(vsd.expr[,colnames(vsd.expr)==col],end=15)
    vsd.exprG <- merge(anno,vsd.expr,by="ID")
  }
  return(vsd.exprG)
}
