package map.dto;

public class Category {

    private String servletPath;
    private String fileName;
    private String name;

    public Category(String servletPath, String name) {
        this.servletPath = servletPath;
        this.name = name;
        this.fileName = servletPath.substring(servletPath.lastIndexOf("/"));
    }

    public static Category of(String servletPath, String name) {
        return new Category(servletPath, name);
    }

    public String getServletPath() {
        return servletPath;
    }

    public String getName() {
        return name;
    }

    public boolean isActivate(String fileName) {
        return this.fileName.equals(fileName);
    }
}
