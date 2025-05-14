function deleteInquiry(id) {
    if (!confirm('정말 이 문의내역을 삭제하시겠습니까?')) {
        return;
    }

    fetch(`/admin/inquiries/${id}/delete`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.text())
    .then(result => {
        if (result === 'success') {
            alert('문의내역이 삭제되었습니다.');
            window.location.href = '/admin/inquiries';
        } else {
            alert('삭제 중 오류가 발생했습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('삭제 중 오류가 발생했습니다.');
    });
}

// 테이블 정렬 기능
document.addEventListener('DOMContentLoaded', function() {
    const table = document.querySelector('table');
    const headers = table.querySelectorAll('th');
    
    headers.forEach((header, index) => {
        header.addEventListener('click', () => {
            const rows = Array.from(table.querySelectorAll('tbody tr'));
            const isNumeric = index === 0; // ID 컬럼은 숫자 정렬
            
            rows.sort((a, b) => {
                const aValue = a.cells[index].textContent.trim();
                const bValue = b.cells[index].textContent.trim();
                
                if (isNumeric) {
                    return parseInt(aValue) - parseInt(bValue);
                }
                return aValue.localeCompare(bValue, 'ko');
            });
            
            // 정렬된 행을 테이블에 다시 추가
            const tbody = table.querySelector('tbody');
            tbody.innerHTML = '';
            rows.forEach(row => tbody.appendChild(row));
        });
    });
}); 