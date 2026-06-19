namespace Belin.UI;

using System.Globalization;

/// <summary>
/// Tests the features of the <see cref="StringExtensions"/> class.
/// </summary>
[TestClass]
public sealed class StringExtensionsTests {

	[TestMethod]
	public void Capitalize() {
		var culture = new CultureInfo("fr-FR");

		// It should convert in uppercase the first character of the specified string.
		AreEqual("", "".Capitalize(culture));
		AreEqual("Foo bAr baZ", "foo bAr baZ".Capitalize(culture));
	}

	[TestMethod]
	public void Truncate() {
		// It should truncate the string to the specified length.
		AreEqual("", "".Truncate(0));
		AreEqual("foo bar", "foo bar".Truncate(7));
		AreEqual("...", "foo bar".Truncate(0));
		AreEqual("foo ...", "foo bar".Truncate(4));

		// It should append the specified ellipsis to the truncated string.
		AreEqual("--", "foo bar".Truncate(0, "--"));
		AreEqual("foo --", "foo bar".Truncate(4, "--"));
	}
}
