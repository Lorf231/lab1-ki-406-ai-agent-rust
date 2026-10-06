use hello::addition;

#[allow(non_snake_case)]
#[test]
fn BasicAddition() {
    assert_eq!(addition(2, 2), 4);
}
