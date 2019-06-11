AnnoENSG<-function(EntrezID=F,col="rownames",data=vsd.expr,FilterLnc=F){ 
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
  if (FilterLnc==T){
    vsd.exprG<-subset(vsd.exprG,
                      vsd.exprG$TYPE=="antisense" | 
                        vsd.exprG$TYPE=="lincRNA"| 
                        vsd.exprG$TYPE=="sense_intronic"| 
                        vsd.exprG$TYPE=="3prime_overlapping_ncRNA"| 
                        vsd.exprG$TYPE=="non_coding"| 
                        vsd.exprG$TYPE=="retained_intron"| 
                        vsd.exprG$TYPE=="sense_overlapping"| 
                        vsd.exprG$TYPE=="macro_lncRNA")
  }
  return(vsd.exprG)
}