package vignan;

import jakarta.persistence.*;

@Entity
@Table(name = "Issues")
public class Issues {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "description")
    private String description;

    @Column(name = "priority")
    private int priority;

    @Column(name = "assignedTo")
    private String assignedTo;

    @Column(name = "status")
    private String status;

    @Column(name = "dueDate")
    private String dueDate;

    @Column(name = "category")
    private String category;

    public Issues(String title, String description, int priority, String assignedTo, String status, String dueDate, String category) {
        this.title = title;
        this.description = description;
        this.priority = priority;
        this.assignedTo = assignedTo;
        this.status = status;
        this.dueDate = dueDate;
        this.category = category;
    }

    public Issues() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public String getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
