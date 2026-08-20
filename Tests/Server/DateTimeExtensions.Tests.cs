namespace Belin.UI;

/// <summary>
/// Tests the features of the <see cref="DateTimeExtensions"/> class.
/// </summary>
[TestClass]
public sealed class DateTimeExtensionsTests {

	[TestMethod]
	public void Quarter() {
		// It should return the quarter number for the given date.
		AreEqual(4, new DateTime(2015, 12, 31).Quarter);
		AreEqual(3, new DateTime(2017, 7, 14).Quarter);
		AreEqual(2, new DateTime(2020, 5, 3).Quarter);
		AreEqual(1, new DateTime(2023, 1, 1).Quarter);
		AreEqual(1, new DateTime(2024, 2, 29).Quarter);
	}

	[TestMethod]
	public void WeekOfYear() {
		// It should return the week of year for the given date.
		AreEqual(53, new DateTime(2015, 12, 31).WeekOfYear);
		AreEqual(28, new DateTime(2017, 7, 14).WeekOfYear);
		AreEqual(18, new DateTime(2020, 5, 3).WeekOfYear);
		AreEqual(52, new DateTime(2023, 1, 1).WeekOfYear);
		AreEqual(9, new DateTime(2024, 2, 29).WeekOfYear);
	}
}
