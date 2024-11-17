import java.sql.*;
import java.util.Scanner;

/* 

 Linux : 
    javac -cp .:mysql-connector-j-8.0.31.jar jdbc.java
    java -cp .:mysql-connector-j-8.0.31.jar jdbc

Windows : 
    javac -cp .;mysql-connector-j-8.0.31.jar jdbc.java
    java -cp .;mysql-connector-j-8.0.31.jar jdbc

*/

public class jdbc {
    // Database URL, Username, and Password
    static final String DB_URL = "jdbc:mysql://localhost:3306/egrocery";
    static final String USER = "root";
    static final String PASS = "";

    public static void main(String[] args) throws ClassNotFoundException {
        Scanner scanner = new Scanner(System.in);
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected to the database!");

            while (true) {
                System.out.println("\nChoose an operation:");
                System.out.println("1. Create (Insert)");
                System.out.println("2. Read (Select)");
                System.out.println("3. Update");
                System.out.println("4. Delete");
                System.out.println("5. Exit");
                System.out.print("Enter your choice: ");
                int choice = scanner.nextInt();

                switch (choice) {
                    case 1 -> createUser(conn, scanner);
                    case 2 -> readUsers(conn);
                    case 3 -> updateUser(conn, scanner);
                    case 4 -> deleteUser(conn, scanner);
                    case 5 -> {
                        System.out.println("Exiting program.");
                        return;
                    }
                    default -> System.out.println("Invalid choice. Please try again.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Create (Insert)
    public static void createUser(Connection conn, Scanner scanner) throws SQLException {
        System.out.print("Enter name: ");
        String name = scanner.next();
        System.out.print("Enter email: ");
        String email = scanner.next();
        System.out.print("Enter country: ");
        String country = scanner.next();

        String sql = "INSERT INTO users (name, email, country) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, country);
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("User added successfully!");
            }
        }
    }

    // Read (Select)
    public static void readUsers(Connection conn) throws SQLException {
        String sql = "SELECT * FROM users";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            System.out.println("ID | Name | Email | Country");
            System.out.println("-----------------------------");
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                System.out.printf("%d | %s | %s | %s%n", id, name, email, country);
            }
        }
    }

    // Update
    public static void updateUser(Connection conn, Scanner scanner) throws SQLException {
        System.out.print("Enter user ID to update: ");
        int id = scanner.nextInt();
        System.out.print("Enter new email: ");
        String email = scanner.next();

        String sql = "UPDATE users SET email = ? WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setInt(2, id);
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("User updated successfully!");
            } else {
                System.out.println("User not found.");
            }
        }
    }

    // Delete
    public static void deleteUser(Connection conn, Scanner scanner) throws SQLException {
        System.out.print("Enter user ID to delete: ");
        int id = scanner.nextInt();

        String sql = "DELETE FROM users WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int rowsDeleted = pstmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("User deleted successfully!");
            } else {
                System.out.println("User not found.");
            }
        }
    }
}
