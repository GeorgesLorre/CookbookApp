$(document).ready(function(){
    $(".deleteMe").on("click", function(event){
       const data = { index: event.currentTarget.dataset.target};
       $(this).closest("li").remove();
       fetch('/remove', {
        body: JSON.stringify(data), // must match 'Content-Type' header
        headers: {'content-type': 'application/json'},
        method: 'POST', // *GET, PUT, DELETE, etc.
        })
    });

});
