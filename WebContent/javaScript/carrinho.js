const removerProdutos= document.getElementsByClassName("remover") ;
console.log(removerProdutos);
for (var i=0; i<removerProdutos.length; i++){
    removerProdutos[i].addEventListener("click", function(event){
        event.target.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
    })
}
