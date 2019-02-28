AnnoENSG<-function(Entrez=T,data=vsd.expr,datafrom="TCGA"){ 
  vsd.expr<-data
  if (Entrez==T){ 
    if (datafrom=="TCGA"){
      vsd.expr$TCGA.ID<-rownames(vsd.expr)
      vsd.exprG <- merge(annoENSG.entrz,vsd.expr,by="TCGA.ID")
    }else{
      vsd.expr$ENSG<-rownames(vsd.expr)
      vsd.exprG <- merge(annoENSG.entrz,vsd.expr,by="ENSG")
    }
  }else{
    if (datafrom=="TCGA"){
      vsd.expr$TCGA.ID<-rownames(vsd.expr)
      vsd.exprG <- merge(anno.ENSG,vsd.expr,by="TCGA.ID")
    }else{
      vsd.expr$ENSG<-rownames(vsd.expr)
      vsd.exprG <- merge(anno.ENSG,vsd.expr,by="ENSG")
    }
  }
  return(vsd.exprG)
}