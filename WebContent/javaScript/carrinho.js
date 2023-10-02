if (document.readyState == "loading"){
    document.addEventListener("DOMContentLoaded", ready);
} else {
    ready();
}

function ready(){
    const removerProdutos= document.getElementsByClassName("remover") ;
    console.log(removerProdutos);
    for (var i=0; i<removerProdutos.length; i++){
        removerProdutos[i].addEventListener("click", removerProduto);
    }
    
    const quantidadeInput = document.getElementsByClassName("tr1");
    for (var i=0; i<quantidadeInput.length; i++){
        quantidadeInput[i].addEventListener("change", valorTotal);
    }
}

function removerProduto(event){
    event.target.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
    valorTotal();
}

function valorTotal(){
    let valorTotal = 0;
    const carroProdutos = document.getElementsByClassName("tr1");
    for(var i=0; i<carroProdutos.length; i++){
        console.log(carroProdutos[i]);
        const produtoPreco = carroProdutos[i].getElementsByClassName("preco")[0].innerText.replace("R$", "").replace(",", ".");
        const produtoQuantidade = carroProdutos[i].getElementsByClassName("quantidade")[0].value;
        valorTotal += produtoPreco * produtoQuantidade;
    }
    valorTotal = valorTotal.toFixed(2);
    valorTotal = valorTotal.replace(".", ",");
    document.querySelector(".subtotal").innerText = "R$" + valorTotal;
    total();
}

function total(){
    let total = 0; 
    const resumoValor = document.getElementsByClassName("info1"); 
    for(var i=0; i<resumoValor.length; i++){
        console.log(resumoValor[i]);
        const carroSubtotal = resumoValor[i].getElementsByClassName("subtotal")[0].innerText.replace("R$", "").replace(",", "."); 
        const produtoFrete = resumoValor[i].getElementsByClassName("frete")[0].innerText.replace("R$", "").replace(",", ".");
        total += carroSubtotal + produtoFrete; 
    }
    console.log(typeof total); 
    total = Number(total);
    total = total.toFixed(2); 
    total = total.replace(".", ","); 
    document.querySelector(".total").innerText = "R$" + total; 
}
