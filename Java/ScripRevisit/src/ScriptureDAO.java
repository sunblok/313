import java.util.List;


public interface ScriptureDAO
{
   boolean createScripture(scripture newScripture);
   scripture getScritpure(int scritpureId);
   List<scripture> getAllScritpures();
}
