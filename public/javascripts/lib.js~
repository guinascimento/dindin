function paid(id) {
	jQuery.ajax(
		{
			data:'authenticity_token=' + encodeURIComponent('738Mq3yYmZdPlNlRHp3guAWEuEg0NM57pjODApL0cbw='),
			dataType:'script',
			type:'post',
			url:'/invoice/paid/'+id
		}
	);

	$("#"+id).remove()
	$("#paid"+id).append("<img src='/images/yes.png' width='19px' height='19px' border='0' onclick="alert('aaa')" />")
}

function unpaid(id) {
	jQuery.ajax(
		{
			data:'authenticity_token=' + encodeURIComponent('738Mq3yYmZdPlNlRHp3guAWEuEg0NM57pjODApL0cbw='),
			dataType:'script',
			type:'post',
			url:'/invoice/unpaid/'+id
		}
	);

	$("#"+id).remove()
	$("#paid"+id).append("<a href='#' onclick='paid('"+id+"')'><img src='/images/no.png' width='19px' height='19px' border='0' /></a>")
}
