package bOdata;

public class DAOFactory 
{
   public BOFace getBODao() 
   {
       return new BOData();
   }
}