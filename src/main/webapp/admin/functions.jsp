<%@page import="org.apache.catalina.tribes.group.interceptors.TwoPhaseCommitInterceptor.MapEntry"%>
<%@page import="org.apache.tomcat.jni.Directory"%>
<%@page import="com.matisse.MtDatabase"%>
<%@ page import = "java.lang.String,java.io.File,java.sql.*, javax.servlet.*,one.connect,one.Functions,org.apache.tomcat.util.http.fileupload.servlet.*,java.util.*,org.apache.tomcat.util.http.fileupload.*,org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>

<%
// Create a new database class
connect con = new one.connect(); 
Statement stm = con.getStatement();


// Get working directory
String filePath = "C:\\Users\\Cryzenn\\wspace\\auction\\src\\main\\webapp\\Images"; 
//out.println(filePath);
Map<String, String> formValues = new HashMap<String, String>();
File file; 
String imageFile = ""; 
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (isMultipart)
{
    try 
    {
    	FileItemFactory factory = new DiskFileItemFactory();
    	ServletFileUpload upload = new ServletFileUpload(factory);
        List items = upload.parseRequest(new ServletRequestContext(request));
        Iterator iterator = items.iterator();
        while (iterator.hasNext()) 
        {
            FileItem item = (FileItem) iterator.next();

            if (item.isFormField()) //your code for getting form fields
            {
                String name = item.getFieldName();
                String value = item.getString();
               	formValues.put(name, value);
            }

            if (!item.isFormField()) 
            {
	            // Get the uploaded file parameters
	            String fieldName = item.getFieldName();
	            String fileName = item.getName();
	            
	            boolean isInMemory = item.isInMemory();
	            long sizeInBytes = item.getSize();
	         	//String filePath = getServletContext().getRealPath("/") + "admin\\Images";
	         	//out.println(filePath);
	         	
	         	
	         	// Name of the image file
	         	imageFile = fileName.substring(fileName.lastIndexOf("\\")+1);
	       		
	         	
	         	
	         	
	         	// Write the file
	            if( fileName.lastIndexOf("\\") >= 0 ) {
	               file = new File( filePath + 
	               fileName.substring( fileName.lastIndexOf("\\")));
	               out.println(filePath + fileName.substring( fileName.lastIndexOf("\\")));
	            } else {
	               file = new File( filePath + "\\" +
	               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	               out.println(filePath + "\\" +fileName.substring( fileName.lastIndexOf("\\")+1));
	            }
	         	out.println(filePath);
	         	// Upload the file
	            item.write( file ) ;
            }
        }
       
        
	   // Get item lot number
	   Functions ln = new Functions(); 
	   int item_lot_number = ln.generateKey(); 
       String query = "INSERT INTO auction_items VALUES (" +item_lot_number+ ",'"+formValues.get("name")+"', '"+formValues.get("date")+"', '"+formValues.get("category")+"', '"+formValues.get("medium")+"', '"+formValues.get("frame")+"', '"+formValues.get("dimensions")+"', '"+formValues.get("description")+"', '"+formValues.get("price")+"', '"+imageFile+"', '"+formValues.get("weight")+"')"; 
       stm.executeQuery(query);
       //out.println(query);
       con.closeConnection();  
       response.sendRedirect("addItem.jsp?added");
    }
    catch(Exception e){
    	con.closeConnection();  
    	out.println(e.getMessage());
    	response.sendRedirect("addItem.jsp?added");
    }
}
%>