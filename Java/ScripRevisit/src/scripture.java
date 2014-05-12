
public class scripture
{
   private String book;
   private int chapter;
   private int verse;
   
   
   public scripture()
   {
      book = "John";
      chapter = 1;
      verse = 1;
   }
   
   public scripture(String nBook, int nchap, int nVer )
   {
      book = nBook;
      chapter = nchap;
      verse = nVer;
   }
   
   public String getBook()
   {
      return book;
   }
   public void setBook( String book)
   {
      this.book = book;
   }
   public int getChapter()
   {
      return chapter;
   }
   public void setChapter( int chapter)
   {
      this.chapter = chapter;
   }
   public int getVerse()
   {
      return verse;
   }
   public void setVerse( int verse)
   {
      this.verse = verse;
   }
}
