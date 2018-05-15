alter table `small_option` add constraint FK_SmallOption_Option
foreign key(option_no)
references `option`(no)
on delete cascade
on update cascade;

alter table `cart_option` add constraint FK_CartOption_Cart
foreign key(cart_no)
references `cart`(no)
on delete cascade
on update cascade;

alter table `cart_option` add constraint FK_CartOption_SmallOption
foreign key(small_option_no)
references `small_option`(no)
on delete cascade
on update cascade;

/* 카테고리 목록 */
insert into category
values(null, '여성의류', '/assets/images/main_menu01_off.png');


insert into category
values(null, '남성의류', '/assets/images/main_menu02_off.png');


insert into category
values(null, '언더웨어', '/assets/images/main_menu03_off.png');


insert into category
values(null, '브랜드 여성의류', '/assets/images/main_menu04_off.png');


insert into category
values(null, '브랜드 남성의류', '/assets/images/main_menu05_off.png');


insert into category
values(null, '브랜드 진/캐쥬얼', '/assets/images/main_menu06_off.png');

/* 상태 목록 */
insert into status
values(null, '판매중');


insert into status
values(null, '판매중지');


insert into status
values(null, '품절');

/* 아이콘 목록 */
insert into `icon`
values(null, 'New', '${pageContext.servletContext.contextPath}/assets/images/i_new.gif');


insert into `icon`
values(null, 'Hit', '${pageContext.servletContext.contextPath}/assets/images/i_hit.gif');


insert into `icon`
values(null, 'Sale', '${pageContext.servletContext.contextPath}/assets/images/i_sale.gif');

/* 관리자 추가 */
insert into member
values(null, 'admin', password('admin'), 'admin', '1900-01-01', '00-000-0000', '000-0000-0000', '-', 'admin@yorha.com', now(), 1);
