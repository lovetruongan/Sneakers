package com.example.Sneakers.utils;

import com.example.Sneakers.models.Order;
import com.example.Sneakers.models.OrderDetail;

public class BuilderEmailContent {
    public static String buildOrderEmailContent(Order order) {
        StringBuilder content = new StringBuilder();
        content.append("<html><body>");
        content.append("<h2>Xin chào " + order.getFullName() + ",</h2>");
        content.append("<p>Cảm ơn bạn đã đặt hàng tại cửa hàng chúng tôi. Dưới đây là chi tiết đơn hàng của bạn:</p>");
        content.append("<p><strong>Mã đơn hàng:</strong> " + order.getId() + "</p>");
        content.append("<p><strong>Ngày đặt hàng:</strong> " + order.getOrderDate() + "</p>");
        content.append("<p><strong>Phương thức thanh toán:</strong> " + order.getPaymentMethod() + "</p>");
        content.append("<p><strong>Tổng tiền:</strong> " + order.getTotalMoney() + " VND</p>");
        content.append("<p><strong>Trạng thái đơn hàng:</strong> " + order.getStatus() + "</p>");

        // Thêm danh sách sản phẩm trong đơn hàng (nếu có)
        if (order.getOrderDetails() != null && !order.getOrderDetails().isEmpty()) {
            content.append("<h3>Danh sách sản phẩm:</h3>");
            content.append("<ul>");
            for (OrderDetail orderDetail : order.getOrderDetails()) {
                content.append("<li>" + orderDetail.getProduct().getName() + " - Số lượng: " + orderDetail.getNumberOfProducts() + "</li>");
            }
            content.append("</ul>");
        }

        content.append("<p>Xin vui lòng liên hệ với chúng tôi nếu bạn có bất kỳ câu hỏi hoặc yêu cầu nào.</p>");
        content.append("<p>Trân trọng,</p>");
        content.append("<p>Cửa hàng Sneakers</p>");
        content.append("</body></html>");

        return content.toString();
    }
}