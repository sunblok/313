$(function(){
    $("#btnUpdateTime").click(updateTime);
});

function updateTime()
{
   $.get("time.php",{dateFormat:"hh:mm:ss"},function(data)
      {
         $("#serverTime").append(data);
      }
   );
}

function getSuggestions()
{
   var userInput = $("#txtInput").val();
   $.get("time.php",{},function(data){
      $("#divSuggestions").append("There is much to learn<br/>" + data + userInput);
   });
}

function uploadPic()
{
   $.get("upload_file.php",{},function(){
   });

}